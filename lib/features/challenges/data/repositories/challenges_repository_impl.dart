import 'package:isar/isar.dart';
import 'package:ecodcf/features/challenges/data/models/challenge_model.dart';
import 'package:ecodcf/features/challenges/domain/entities/challenge.dart' as challenges;
import 'package:ecodcf/features/challenges/domain/repositories/challenges_repository.dart';

class ChallengesRepositoryImpl implements ChallengesRepository {
  final Isar _isar;

  ChallengesRepositoryImpl(this._isar);

  @override
  Future<List<challenges.Challenge>> getAllChallenges() async {
    final models = await _isar.challengeModels.where().findAll();
    return models.map(_toEntity).toList();
  }

  @override
  Future<challenges.Challenge> getChallengeById(String id) async {
    final model = await _isar.challengeModels.filter().remoteIdEqualTo(id).findFirst();
    if (model == null) throw Exception('Challenge not found');
    return _toEntity(model);
  }

  @override
  Future<void> completeChallenge(String id) async {
    final model = await _isar.challengeModels.filter().remoteIdEqualTo(id).findFirst();
    if (model != null) {
      await _isar.writeTxn(() async {
        model.isCompleted = true;
        model.completedAt = DateTime.now();
        await _isar.challengeModels.put(model);
      });
    }
  }

  @override
  Future<List<challenges.Challenge>> getActiveChallenges() async {
    final models = await _isar.challengeModels.filter().isCompletedEqualTo(false).findAll();
    return models.map(_toEntity).toList();
  }

  challenges.Challenge _toEntity(ChallengeModel model) {
    return challenges.Challenge(
      id: model.remoteId,
      title: model.title,
      description: model.description,
      icon: model.icon,
      xpReward: model.xpReward,
      isCompleted: model.isCompleted,
      completedAt: model.completedAt,
    );
  }
}

