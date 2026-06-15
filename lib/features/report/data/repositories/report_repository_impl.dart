import 'package:ecodcf/features/report/domain/entities/report.dart';
import 'package:ecodcf/features/report/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  @override
  Future<List<Report>> getAllReports() async => [];

  @override
  Future<Report> getReportById(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<void> generateReport(Report report) async {}
}
