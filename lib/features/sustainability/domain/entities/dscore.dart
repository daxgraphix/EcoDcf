import 'package:equatable/equatable.dart';

class DScore extends Equatable {
  final double score;
  final String level;
  final DateTime date;

  const DScore({
    this.score = 0.0,
    this.level = 'Beginner',
    required this.date,
  });

  @override
  List<Object?> get props => [score, level, date];

  DScore copyWith({double? score, String? level, DateTime? date}) {
    return DScore(
      score: score ?? this.score,
      level: level ?? this.level,
      date: date ?? this.date,
    );
  }
}