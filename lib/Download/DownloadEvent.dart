import 'package:equatable/equatable.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object?> get props => [];
}

class DownloadStart extends DownloadEvent {
  final int maxBytes;

  const DownloadStart({
    required this.maxBytes,
  });

  @override
  List<Object?> get props => [maxBytes, ...super.props];
}

class DownloadStop extends DownloadEvent {}

class DownloadReceive extends DownloadEvent {
  final List<int> bytes;

  const DownloadReceive({
    required this.bytes,
  });

  @override
  List<Object?> get props => [bytes, ...super.props];
}

class DownloadComplete extends DownloadEvent {}
