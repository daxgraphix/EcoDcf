import 'package:equatable/equatable.dart';

class DScore extends Equatable {
  final double score;
  final String level;
  final DateTime date;
  final Map<String, dynamic>? breakdown;
  final double? todayCarbon;
  final double? weeklyCarbon;
  final double? monthlyCarbon;
  final Map<String, dynamic>? recommendations;

  const DScore({
    this.score = 0.0,
    this.level = 'Beginner',
    required this.date,
    this.breakdown,
    this.todayCarbon,
    this.weeklyCarbon,
    this.monthlyCarbon,
    this.recommendations,
  });

  @override
  List<Object?> get props => [score, level, date, breakdown, todayCarbon, weeklyCarbon, monthlyCarbon, recommendations];

  DScore copyWith({double? score, String? level, DateTime? date, Map<String, dynamic>? breakdown, double? todayCarbon, double? weeklyCarbon, double? monthlyCarbon, Map<String, dynamic>? recommendations}) {
    return DScore(
      score: score ?? this.score,
      level: level ?? this.level,
      date: date ?? this.date,
      breakdown: breakdown ?? this.breakdown,
      todayCarbon: todayCarbon ?? this.todayCarbon,
      weeklyCarbon: weeklyCarbon ?? this.weeklyCarbon,
      monthlyCarbon: monthlyCarbon ?? this.monthlyCarbon,
      recommendations: recommendations ?? this.recommendations,
    );
  }

  String getLevelName() {
    if (score < 25) return 'Beginner';
    if (score < 50) return 'Aware User';
    if (score < 75) return 'Optimizer';
    if (score < 90) return 'Champion';
    return 'Digital Guardian';
  }

  int getProgressToNextLevel() {
    if (score >= 90) return 0;
    final thresholds = [25.0, 50.0, 75.0, 90.0];
    for (final threshold in thresholds) {
      if (score < threshold) return (threshold - score).round();
    }
    return 0;
  }
}