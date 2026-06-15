import 'package:equatable/equatable.dart';

class DScore extends Equatable {
  final double score;
  final String level;
  final DateTime date;
  final Map<String, dynamic>? breakdown;

  const DScore({
    this.score = 0.0,
    this.level = 'Beginner',
    required this.date,
    this.breakdown,
  });

  @override
  List<Object?> get props => [score, level, date, breakdown];

  DScore copyWith({double? score, String? level, DateTime? date, Map<String, dynamic>? breakdown}) {
    return DScore(
      score: score ?? this.score,
      level: level ?? this.level,
      date: date ?? this.date,
      breakdown: breakdown ?? this.breakdown,
    );
  }

  String getLevelName() {
    if (score < 25) return 'Beginner';
    if (score < 50) return 'Aware User';
    if (score < 75) return 'Optimizer';
    if (score < 90) return 'Champion';
    return 'Digital Guardian';
  }
}