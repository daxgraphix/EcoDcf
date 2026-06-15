import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/report/domain/entities/report.dart';

final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) {
  return ReportNotifier();
});

abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoaded extends ReportState {
  final List<Report> reports;

  ReportLoaded(this.reports);
}

class ReportError extends ReportState {
  final String message;

  ReportError(this.message);
}

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier() : super(ReportInitial());
}
