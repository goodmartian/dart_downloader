import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'DownloadEvent.dart';
import 'DownloadState.dart';

class Download extends Bloc<DownloadEvent, DownloadState> {
  Download(final String url) : super(DownloadStopped(url: url)) {
    download();
  }

  Future<void> download() async {
    var client = http.Client();

    var request = http.Request(
      'GET',
      Uri.parse(state.url),
    ); //..headers['referer'] = '';

    var response = await client.send(request);

    var stream = response.stream;
    stream.handleError(
      (e) async {
        await Future.delayed(Duration(seconds: 5));
        await download();
      },
    );
    stream.timeout(
      Duration(seconds: 10),
      onTimeout: (e) async {
        await Future.delayed(Duration(seconds: 5));
        await download();
      },
    );

    add(DownloadStart(maxBytes: response.contentLength!));

    await for (var value in stream) {
      add(DownloadReceive(bytes: value));
    }

    add(DownloadComplete());
  }

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    if (event is DownloadStart) {
      yield DownloadInProgress(url: state.url, bytes: [], maxBytes: event.maxBytes);
    } else if (event is DownloadReceive && state is DownloadInProgress) {
      (state as DownloadInProgress).bytes.addAll(event.bytes);
      yield DownloadInProgress(url: state.url, bytes: (state as DownloadInProgress).bytes, maxBytes: (state as DownloadInProgress).maxBytes);
    } else if (event is DownloadComplete && state is DownloadInProgress) {
      yield DownloadCompleted(url: state.url, bytes: (state as DownloadInProgress).bytes, maxBytes: (state as DownloadInProgress).maxBytes);
    } else if (event is DownloadStop) {
      yield DownloadStopped(url: state.url);
    }
  }
}
