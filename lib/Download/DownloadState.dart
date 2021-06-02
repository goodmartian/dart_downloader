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

// ignore: must_be_immutable
class DownloadContentState extends DownloadState {
  List<int> bytes;
  final int maxBytes;

  DownloadContentState({
    required String url,
    required this.bytes,
    required this.maxBytes,
  }) : super(url);

  @override
  List<Object?> get props => [bytes, maxBytes, ...super.props];
}

// ignore: must_be_immutable
class DownloadInProgress extends DownloadContentState {
  DownloadInProgress({
    required String url,
    required List<int> bytes,
    required int maxBytes,
  }) : super(url: url, bytes: bytes, maxBytes: maxBytes);
}

// ignore: must_be_immutable
class DownloadCompleted extends DownloadContentState {
  DownloadCompleted({
    required String url,
    required List<int> bytes,
    required int maxBytes,
  }) : super(url: url, bytes: bytes, maxBytes: maxBytes);
}
