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
  final int maxBytes;

  const DownloadContentState({
    required String url,
    required this.bytes,
    required this.maxBytes,
  }) : super(url);

  @override
  List<Object?> get props => [bytes, maxBytes, ...super.props];
}

class DownloadInProgress extends DownloadContentState {
  const DownloadInProgress({
    required String url,
    required List<int> bytes,
    required int maxBytes,
  }) : super(url: url, bytes: bytes, maxBytes: maxBytes);
}

class DownloadCompleted extends DownloadContentState {
  const DownloadCompleted({
    required String url,
    required List<int> bytes,
    required int maxBytes,
  }) : super(url: url, bytes: bytes, maxBytes: maxBytes);
}
