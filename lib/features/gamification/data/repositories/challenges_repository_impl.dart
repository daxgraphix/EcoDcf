import 'package:isar/isar.dart';
import 'package:ecodcf/features/challenges/data/models/challenge_model.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/features/gamification/domain/repositories/gamification_repository.dart';

class ChallengesRepositoryImpl implements ChallengesRepository {
  final Isar _isar;

  ChallengesRepositoryImpl(this._isar);

  @override
  Future<List<Challenge>> getAllChallenges() async {
    final models = await _isar.challengeModels.where().findAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Stream<List<Challenge>> watchAllChallenges() {
    return _isar.challengeModels
        .where()
        .watch()
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<List<Challenge>> getActiveChallenges() async {
    final models = await _isar.challengeModels.filter().isCompletedEqualTo(false).findAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> completeChallenge(String id) async {
    await _isar.writeTxn(() async {
      final model = await _isar.challengeModels.filter().remoteIdEqualTo(id).findFirst();
      if (model != null) {
        model.isCompleted = true;
        model.completedAt = DateTime.now();
        await _isar.challengeModels.put(model);
      }
    });
  }

  @override
  Future<void> updateChallengeProgress(String id, int progress) async {
    await _isar.writeTxn(() async {
      final model = await _isar.challengeModels.filter().remoteIdEqualTo(id).findFirst();
      if (model != null) {
        model.currentProgress = progress.toDouble();
        if (model.currentProgress >= model.targetValue) {
          model.isCompleted = true;
          model.completedAt = DateTime.now();
        }
        await _isar.challengeModels.put(model);
      }
    });
  }

  @override
  Future<void> updateChallengeProgressByType(ChallengeType type, int progress) async {
    await _isar.writeTxn(() async {
      final models = await _isar.challengeModels.filter().typeEqualTo(type).findAll();
      for (final model in models) {
        model.currentProgress += progress.toDouble();
        if (model.currentProgress >= model.targetValue) {
          model.isCompleted = true;
          model.completedAt = DateTime.now();
        }
        await _isar.challengeModels.put(model);
      }
    });
  }
}

