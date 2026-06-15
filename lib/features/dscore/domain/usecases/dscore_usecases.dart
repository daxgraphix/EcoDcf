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
    final dscore = DScore(
      score: score,
      level: _getLevelName(score),
      date: DateTime.now(),
      breakdown: input.toMap(),
    );
    _repository.saveScore(dscore);
    return Future.value(dscore);
  }

  double _calculateScore(DScoreInput input) {
    double total = 100.0;

    total -= input.deviceCarbon * 2;
    total -= input.internetCarbon * 1.5;
    total -= input.streamingCarbon * 3;
    total -= input.emailCarbon * 0.5;
    total -= input.cloudCarbon * 2;
    total -= input.aiCarbon * 4;
    total -= input.socialCarbon * 1;

    return total.clamp(0.0, 100.0);
  }

  String _getLevelName(double score) {
    if (score < 25) return 'Beginner';
    if (score < 50) return 'Aware User';
    if (score < 75) return 'Optimizer';
    if (score < 90) return 'Champion';
    return 'Digital Guardian';
  }
}

class DScoreInput {
  final double deviceCarbon;
  final double internetCarbon;
  final double streamingCarbon;
  final double emailCarbon;
  final double cloudCarbon;
  final double aiCarbon;
  final double socialCarbon;

  DScoreInput({
    this.deviceCarbon = 0.0,
    this.internetCarbon = 0.0,
    this.streamingCarbon = 0.0,
    this.emailCarbon = 0.0,
    this.cloudCarbon = 0.0,
    this.aiCarbon = 0.0,
    this.socialCarbon = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'deviceCarbon': deviceCarbon,
      'internetCarbon': internetCarbon,
      'streamingCarbon': streamingCarbon,
      'emailCarbon': emailCarbon,
      'cloudCarbon': cloudCarbon,
      'aiCarbon': aiCarbon,
      'socialCarbon': socialCarbon,
    };
  }
}
