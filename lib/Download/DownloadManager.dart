import 'package:bloc/bloc.dart';

import 'Download.dart';
import 'DownloadManagerEvent.dart';
import 'DownloadManagerState.dart';

class DownloadManager extends Bloc<DownloadManagerEvent, DownloadManagerState> {
  DownloadManager() : super(DownloadManagerState());

  @override
  Stream<DownloadManagerState> mapEventToState(DownloadManagerEvent event) async* {
    if (event is DownloadManagerAdd) {
      yield DownloadManagerState(
        downloads: [
          ...state.downloads,
          Download(event.url, file: event.file),
        ],
      );
    }
  }
}
