import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/analytics/domain/entities/analytics_data.dart';

final analyticsProvider = StateNotifierProvider<AnalyticsNotifier, AnalyticsState>((ref) {
  return AnalyticsNotifier();
});

abstract class AnalyticsState {}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final List<AnalyticsData> dailyData;
  final List<AnalyticsData> weeklyData;
  final List<AnalyticsData> monthlyData;
  final List<AnalyticsData> yearlyData;

  AnalyticsLoaded({
    required this.dailyData,
    required this.weeklyData,
    required this.monthlyData,
    required this.yearlyData,
  });
}

class AnalyticsError extends AnalyticsState {
  final String message;

  AnalyticsError(this.message);
}

class AnalyticsNotifier extends StateNotifier<AnalyticsState> {
  AnalyticsNotifier() : super(AnalyticsInitial());

  Future<void> loadAnalyticsData() async {
    state = AnalyticsLoading();
    try {
      state = AnalyticsLoaded(
        dailyData: [],
        weeklyData: [],
        monthlyData: [],
        yearlyData: [],
      );
    } catch (e) {
      state = AnalyticsError(e.toString());
    }
  }
}
