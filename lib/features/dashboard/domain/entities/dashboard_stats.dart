import 'package:equatable/equatable.dart';

class DashboardStats extends Equatable {
  final double totalCarbon;
  final double todayCarbon;
  final double todayUsageHours;
  final double weeklyChange;
  final int streakDays;
  final double dscore;
  final int todaySteps;
  final int globalTreesSaved;

  const DashboardStats({
    this.totalCarbon = 0.0,
    this.todayCarbon = 0.0,
    this.todayUsageHours = 0.0,
    this.weeklyChange = 0.0,
    this.streakDays = 0,
    this.dscore = 0.0,
    this.todaySteps = 0,
    this.globalTreesSaved = 0,
    this.totalSaved = 0.0,
    this.deviceBreakdown = const {},
  });

  final double totalSaved;
  final Map<String, double> deviceBreakdown;

  @override
  List<Object?> get props => [
        totalCarbon,
        todayCarbon,
        todayUsageHours,
        weeklyChange,
        streakDays,
        dscore,
        todaySteps,
        globalTreesSaved,
        totalSaved,
        deviceBreakdown,
      ];

  DashboardStats copyWith({
    double? totalCarbon,
    double? todayCarbon,
    double? todayUsageHours,
    double? weeklyChange,
    int? streakDays,
    double? dscore,
    int? todaySteps,
    int? globalTreesSaved,
    double? totalSaved,
    Map<String, double>? deviceBreakdown,
  }) {
    return DashboardStats(
      totalCarbon: totalCarbon ?? this.totalCarbon,
      todayCarbon: todayCarbon ?? this.todayCarbon,
      todayUsageHours: todayUsageHours ?? this.todayUsageHours,
      weeklyChange: weeklyChange ?? this.weeklyChange,
      streakDays: streakDays ?? this.streakDays,
      dscore: dscore ?? this.dscore,
      todaySteps: todaySteps ?? this.todaySteps,
      globalTreesSaved: globalTreesSaved ?? this.globalTreesSaved,
      totalSaved: totalSaved ?? this.totalSaved,
      deviceBreakdown: deviceBreakdown ?? this.deviceBreakdown,
    );
  }
}
