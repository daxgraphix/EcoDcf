import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:ecodcf/features/dashboard/domain/repositories/dashboard_repository.dart';

abstract class GetDashboardStatsUseCase {
  Future<DashboardStats> call();
}

class GetDashboardStatsUseCaseImpl implements GetDashboardStatsUseCase {
  final DashboardRepository _repository;

  GetDashboardStatsUseCaseImpl(this._repository);

  @override
  Future<DashboardStats> call() => _repository.getDashboardStats();
}
