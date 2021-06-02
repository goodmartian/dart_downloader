import 'package:equatable/equatable.dart';

abstract class DownloadManagerEvent extends Equatable {
  const DownloadManagerEvent();

  @override
  List<Object?> get props => [];
}

class DownloadManagerAdd extends DownloadManagerEvent {
  final String url;
  final Map<String, String> headers;

  const DownloadManagerAdd({
    required this.url,
    this.headers = const {},
  });

  @override
  List<Object?> get props => [url, headers, ...super.props];
}
