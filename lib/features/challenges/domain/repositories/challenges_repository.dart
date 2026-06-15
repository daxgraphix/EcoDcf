import 'package:ecodcf/features/challenges/domain/entities/challenge.dart';

abstract class ChallengesRepository {
  Future<List<Challenge>> getAllChallenges();
  Future<Challenge> getChallengeById(String id);
  Future<void> completeChallenge(String id);
  Future<List<Challenge>> getActiveChallenges();
}
