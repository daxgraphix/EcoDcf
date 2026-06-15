import 'package:ecodcf/features/report/domain/entities/report.dart';

abstract class ReportRepository {
  Future<List<Report>> getAllReports();
  Future<Report> getReportById(String id);
  Future<void> generateReport(Report report);
}
