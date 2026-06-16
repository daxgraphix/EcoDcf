import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';
import 'package:ecodcf/features/dscore/domain/repositories/dscore_repository.dart';

abstract class CalculateDScoreUseCase {
  Future<DScore> call(DScoreInput input);
}

class CalculateDScoreUseCaseImpl implements CalculateDScoreUseCase {
  final DScoreRepository _repository;

  CalculateDScoreUseCaseImpl(this._repository);

  @override
  Future<DScore> call(DScoreInput input) {
    final score = _calculateScore(input);
    final recommendations = _generateRecommendations(input);
    final dscore = DScore(
      score: score,
      level: _getLevelName(score),
      date: DateTime.now(),
      breakdown: input.toMap(),
      todayCarbon: input.todayCarbon,
      weeklyCarbon: input.weeklyCarbon,
      monthlyCarbon: input.monthlyCarbon,
      recommendations: recommendations,
    );
    _repository.saveScore(dscore);
    return Future.value(dscore);
  }

  double _calculateScore(DScoreInput input) {
    double total = 100.0;

    total -= (input.deviceCarbon / 10.0).clamp(0.0, 30.0);
    total -= (input.internetCarbon / 0.5).clamp(0.0, 20.0);
    total -= (input.streamingCarbon * 2).clamp(0.0, 25.0);
    total -= (input.emailCarbon * 10).clamp(0.0, 10.0);
    total -= (input.cloudCarbon / 10.0).clamp(0.0, 15.0);
    total -= (input.socialCarbon * 2).clamp(0.0, 15.0);

    return total.clamp(0.0, 100.0);
  }

  String _getLevelName(double score) {
    if (score < 25) return 'Beginner';
    if (score < 50) return 'Aware User';
    if (score < 75) return 'Optimizer';
    if (score < 90) return 'Champion';
    return 'Digital Guardian';
  }

  Map<String, dynamic> _generateRecommendations(DScoreInput input) {
    final recommendations = <String, dynamic>{
      'quickWins': <String>[],
      'focusAreas': <String>[],
    };

    if (input.streamingCarbon > 2.0) {
      recommendations['quickWins'].add('Reduce streaming quality to SD for large screens');
    }
    if (input.deviceCarbon > 5.0) {
      recommendations['quickWins'].add('Enable dark mode to reduce OLED screen energy');
    }
    if (input.cloudCarbon > 10.0) {
      recommendations['focusAreas'].add('Cloud Storage Optimization');
    }

    return recommendations;
  }
}

class DScoreInput {
  final double deviceCarbon;
  final double internetCarbon;
  final double streamingCarbon;
  final double emailCarbon;
  final double cloudCarbon;
  final double socialCarbon;
  final double aiCarbon;
  final double todayCarbon;
  final double weeklyCarbon;
  final double monthlyCarbon;

  DScoreInput({
    this.deviceCarbon = 0.0,
    this.internetCarbon = 0.0,
    this.streamingCarbon = 0.0,
    this.emailCarbon = 0.0,
    this.cloudCarbon = 0.0,
    this.socialCarbon = 0.0,
    this.aiCarbon = 0.0,
    this.todayCarbon = 0.0,
    this.weeklyCarbon = 0.0,
    this.monthlyCarbon = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'deviceCarbon': deviceCarbon,
      'internetCarbon': internetCarbon,
      'streamingCarbon': streamingCarbon,
      'emailCarbon': emailCarbon,
      'cloudCarbon': cloudCarbon,
      'socialCarbon': socialCarbon,
      'aiCarbon': aiCarbon,
    };
  }
}
