import 'package:equatable/equatable.dart';

abstract class DownloadState extends Equatable {
  final String url;

  const DownloadState(this.url);

  @override
  List<Object?> get props => [url];
}

class DownloadAborted extends DownloadState {
  const DownloadAborted({
    required String url,
  }) : super(url);
}

class DownloadStopped extends DownloadState {
  const DownloadStopped({
    required String url,
  }) : super(url);
}

class DownloadContentState extends DownloadState {
  final List<int> bytes;
  final int curBytes;
  final int maxBytes;

  const DownloadContentState({
    required String url,
    required this.bytes,
    required this.curBytes,
    required this.maxBytes,
  }) : super(url);

  @override
  List<Object?> get props => [curBytes, maxBytes, ...super.props];
}

class DownloadInProgress extends DownloadContentState {
  const DownloadInProgress({
    required String url,
    required List<int> bytes,
    required int curBytes,
    required int maxBytes,
  }) : super(url: url, bytes: bytes, curBytes: curBytes, maxBytes: maxBytes);
}

class DownloadCompleted extends DownloadContentState {
  const DownloadCompleted({
    required String url,
    required List<int> bytes,
    required int curBytes,
    required int maxBytes,
  }) : super(url: url, bytes: bytes, curBytes: curBytes, maxBytes: maxBytes);
}
