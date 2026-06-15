import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

class ChallengeEngine {
  final List<Challenge> _activeChallenges = [];
  final Map<String, int> _challengeProgress = {};

  void initializeChallenges(List<Challenge> challenges) {
    _activeChallenges.addAll(challenges);
  }

  void updateProgress(ChallengeType type, int value) {
    for (var i = 0; i < _activeChallenges.length; i++) {
      final challenge = _activeChallenges[i];
      if (challenge.type == type) {
        final newProgress = (_challengeProgress[challenge.id] ?? 0) + value;
        _challengeProgress[challenge.id] = newProgress;

        if (newProgress >= challenge.targetValue && !challenge.isCompleted) {
          _activeChallenges[i] = challenge.copyWith(
            isCompleted: true,
            completedAt: DateTime.now(),
          );
        }
      }
    }
  }

  List<Challenge> getActiveChallenges() => _activeChallenges.where((c) => !c.isCompleted).toList();

  List<Challenge> getCompletedChallenges() => _activeChallenges.where((c) => c.isCompleted).toList();

  int calculateXP() {
    return _activeChallenges
        .where((c) => c.isCompleted)
        .fold(0, (sum, challenge) => sum + challenge.xpReward);
  }

  void resetDailyChallenges() {
    _activeChallenges.removeWhere((c) => c.type == ChallengeType.device);
    _challengeProgress.clear();
  }
}
