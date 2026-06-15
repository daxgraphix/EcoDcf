import 'package:equatable/equatable.dart';

class DashboardStats extends Equatable {
  final double totalCarbon;
  final double todayCarbon;
  final double todayUsageHours;
  final double weeklyChange;
  final int challengesCompleted;
  final int streakDays;
  final double dscore;

  const DashboardStats({
    this.totalCarbon = 0.0,
    this.todayCarbon = 0.0,
    this.todayUsageHours = 0.0,
    this.weeklyChange = 0.0,
    this.challengesCompleted = 0,
    this.streakDays = 0,
    this.dscore = 0.0,
  });

  @override
  List<Object?> get props => [
        totalCarbon,
        todayCarbon,
        todayUsageHours,
        weeklyChange,
        challengesCompleted,
        streakDays,
        dscore,
      ];

  DashboardStats copyWith({
    double? totalCarbon,
    double? todayCarbon,
    double? todayUsageHours,
    double? weeklyChange,
    int? challengesCompleted,
    int? streakDays,
    double? dscore,
  }) {
    return DashboardStats(
      totalCarbon: totalCarbon ?? this.totalCarbon,
      todayCarbon: todayCarbon ?? this.todayCarbon,
      todayUsageHours: todayUsageHours ?? this.todayUsageHours,
      weeklyChange: weeklyChange ?? this.weeklyChange,
      challengesCompleted: challengesCompleted ?? this.challengesCompleted,
      streakDays: streakDays ?? this.streakDays,
      dscore: dscore ?? this.dscore,
    );
  }
}