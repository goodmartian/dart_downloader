import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class DownloadState extends Equatable {
  final String url;
  final File? file;

  const DownloadState(
    this.url, {
    this.file,
  });

  @override
  List<Object?> get props => [url, file];
}

class DownloadAborted extends DownloadState {
  const DownloadAborted({
    required String url,
    File? file,
  }) : super(url, file: file);
}

class DownloadStopped extends DownloadState {
  const DownloadStopped({
    required String url,
    File? file,
  }) : super(url, file: file);
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
    File? file,
  }) : super(url, file: file);

  @override
  List<Object?> get props => [curBytes, maxBytes, ...super.props];
}

class DownloadInProgress extends DownloadContentState {
  const DownloadInProgress({
    required String url,
    required List<int> bytes,
    required int curBytes,
    required int maxBytes,
    File? file,
  }) : super(url: url, bytes: bytes, curBytes: curBytes, maxBytes: maxBytes, file: file);
}

class DownloadCompleted extends DownloadContentState {
  const DownloadCompleted({
    required String url,
    required List<int> bytes,
    required int curBytes,
    required int maxBytes,
    File? file,
  }) : super(url: url, bytes: bytes, curBytes: curBytes, maxBytes: maxBytes, file: file);
}
