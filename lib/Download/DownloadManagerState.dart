import 'package:equatable/equatable.dart';

import 'Download.dart';

class DownloadManagerState extends Equatable {
  final List<Download> downloads;

  const DownloadManagerState({
    this.downloads = const [],
  });

  @override
  List<Object?> get props => [downloads];
}
