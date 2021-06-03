import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class DownloadManagerEvent extends Equatable {
  const DownloadManagerEvent();

  @override
  List<Object?> get props => [];
}

class DownloadManagerAdd extends DownloadManagerEvent {
  final String url;
  final File? file;
  final Map<String, String> headers;

  const DownloadManagerAdd({
    required this.url,
    this.file,
    this.headers = const {},
  });

  @override
  List<Object?> get props => [url, file, headers, ...super.props];
}
