import 'package:ecodcf/features/dashboard/domain/entities/dashboard_stats.dart';

abstract class DashboardRepository {
  Future<DashboardStats> getDashboardStats();
}
