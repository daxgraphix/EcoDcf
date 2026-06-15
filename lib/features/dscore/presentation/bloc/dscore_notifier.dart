import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/dscore/domain/entities/dscore.dart';
import 'package:ecodcf/features/dscore/domain/usecases/dscore_usecases.dart';

final dscoreProvider = StateNotifierProvider<DScoreNotifier, DScoreState>((ref) {
  return DScoreNotifier();
});

abstract class DScoreState {}

class DScoreInitial extends DScoreState {}

class DScoreLoading extends DScoreState {}

class DScoreLoaded extends DScoreState {
  final DScore dscore;

  DScoreLoaded(this.dscore);
}

class DScoreError extends DScoreState {
  final String message;

  DScoreError(this.message);
}

class DScoreNotifier extends StateNotifier<DScoreState> {
  DScoreNotifier() : super(DScoreInitial());

  Future<void> calculateScore(DScoreInput input) async {
    state = DScoreLoading();
    try {
      final score = _calculateScore(input);
      final dscore = DScore(
        score: score,
        level: _getLevelName(score),
        date: DateTime.now(),
        breakdown: input.toMap(),
      );
      state = DScoreLoaded(dscore);
    } catch (e) {
      state = DScoreError(e.toString());
    }
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
