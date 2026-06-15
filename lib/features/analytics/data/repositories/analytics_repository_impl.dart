import 'package:isar/isar.dart';
import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';
import 'package:ecodcf/features/analytics/domain/repositories/analytics_repository.dart';
import 'package:ecodcf/features/carbon/data/models/carbon_record_model.dart';
import 'package:ecodcf/features/device_usage/data/models/device_usage_model.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final Isar _isar;

  AnalyticsRepositoryImpl(this._isar);

  @override
  Future<List<AnalyticsData>> getDailyData({DateTime? start, DateTime? end}) async {
    final carbonRecords = await _isar.carbonRecordModels
        .filter()
        .optional(start != null, (q) => q.createdAtGreaterThan(start!))
        .optional(end != null, (q) => q.createdAtLessThan(end!))
        .findAll();

    final deviceUsages = await _isar.deviceUsageModels
        .filter()
        .optional(start != null, (q) => q.dateGreaterThan(start!))
        .optional(end != null, (q) => q.dateLessThan(end!))
        .findAll();

    final List<AnalyticsData> results = [];

    for (final record in carbonRecords) {
      results.add(AnalyticsData(
        date: record.createdAt,
        carbonValue: record.carbonValue,
        category: record.type,
      ));
    }

    for (final usage in deviceUsages) {
      final carbonValue = (usage.powerConsumptionWatts * usage.activeHours / 1000) * 0.475;
      results.add(AnalyticsData(
        date: usage.date,
        carbonValue: carbonValue,
        category: 'Device: ${usage.deviceName}',
      ));
    }

    return results..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Future<List<AnalyticsData>> getWeeklyData({DateTime? start, DateTime? end}) async {
    // Basic implementation: get daily and aggregate by week
    final daily = await getDailyData(start: start, end: end);
    final Map<int, double> weeklyAggregated = {};
    final Map<int, DateTime> weekToDate = {};

    for (final data in daily) {
      final weekNum = _getWeekNumber(data.date);
      weeklyAggregated[weekNum] = (weeklyAggregated[weekNum] ?? 0) + data.carbonValue;
      weekToDate[weekNum] = data.date;
    }

    return weeklyAggregated.entries.map((e) {
      return AnalyticsData(
        date: weekToDate[e.key]!,
        carbonValue: e.value,
        category: 'Weekly Total',
      );
    }).toList()..sort((a, b) => a.date.compareTo(b.date));
  }

  int _getWeekNumber(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final dayOfYear = date.difference(firstDayOfYear).inDays;
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  @override
  Future<List<AnalyticsData>> getMonthlyData({DateTime? start, DateTime? end}) async {
    final daily = await getDailyData(start: start, end: end);
    final Map<String, double> monthlyAggregated = {};

    for (final data in daily) {
      final monthKey = DateTime(data.date.year, data.date.month).toIso8601String();
      monthlyAggregated[monthKey] = (monthlyAggregated[monthKey] ?? 0) + data.carbonValue;
    }

    return monthlyAggregated.entries.map((e) {
      return AnalyticsData(
        date: DateTime.parse(e.key),
        carbonValue: e.value,
        category: 'Monthly Total',
      );
    }).toList()..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Future<List<AnalyticsData>> getYearlyData({DateTime? start, DateTime? end}) async {
    final daily = await getDailyData(start: start, end: end);
    final Map<int, double> yearlyAggregated = {};

    for (final data in daily) {
      final year = data.date.year;
      yearlyAggregated[year] = (yearlyAggregated[year] ?? 0) + data.carbonValue;
    }

    return yearlyAggregated.entries.map((e) {
      return AnalyticsData(
        date: DateTime(e.key),
        carbonValue: e.value,
        category: 'Yearly Total',
      );
    }).toList()..sort((a, b) => a.date.compareTo(b.date));
  }
}

