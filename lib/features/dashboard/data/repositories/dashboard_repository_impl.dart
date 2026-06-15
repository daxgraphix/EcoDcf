import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:ecodcf/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<DashboardStats> getDashboardStats() async {
    return const DashboardStats();
  }
}
