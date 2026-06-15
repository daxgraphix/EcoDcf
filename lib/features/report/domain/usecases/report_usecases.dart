import 'package:ecodcf/features/report/domain/entities/report.dart';
import 'package:ecodcf/features/report/domain/repositories/report_repository.dart';

abstract class GetReportsUseCase {
  Future<List<Report>> call();
}

class GetReportsUseCaseImpl implements GetReportsUseCase {
  final ReportRepository _repository;

  GetReportsUseCaseImpl(this._repository);

  @override
  Future<List<Report>> call() => _repository.getAllReports();
}
