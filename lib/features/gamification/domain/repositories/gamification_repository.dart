import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';

abstract class ChallengesRepository {
  Future<List<Challenge>> getAllChallenges();
  Stream<List<Challenge>> watchAllChallenges();
  Future<List<Challenge>> getActiveChallenges();
  Future<void> completeChallenge(String id);
  Future<void> updateChallengeProgress(String id, int progress);
  Future<void> updateChallengeProgressByType(ChallengeType type, int progress);
}

abstract class BadgesRepository {
  Future<List<GamificationBadge>> getAllBadges();
  Future<List<GamificationBadge>> getUnlockedBadges();
  Future<void> unlockBadge(String id);
}
