import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';

abstract class AnalyticsRepository {
  Future<List<AnalyticsData>> getDailyData({DateTime? start, DateTime? end});
  Future<List<AnalyticsData>> getWeeklyData({DateTime? start, DateTime? end});
  Future<List<AnalyticsData>> getMonthlyData({DateTime? start, DateTime? end});
  Future<List<AnalyticsData>> getYearlyData({DateTime? start, DateTime? end});
}
