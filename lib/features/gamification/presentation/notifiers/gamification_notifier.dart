import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/features/gamification/data/repositories/challenges_repository_impl.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';

part 'gamification_notifier.g.dart';

@riverpod
class Gamification extends _$Gamification {
  late final ChallengesRepositoryImpl _repository;

  @override
  Stream<List<Challenge>> build() async* {
    final isar = await ref.watch(isarProvider.future);
    _repository = ChallengesRepositoryImpl(isar);
    yield* _repository.watchAllChallenges();
  }

  Future<void> updateProgress(ChallengeType type, int value) async {
    await _repository.updateChallengeProgressByType(type, value);
  }

  Future<void> completeChallenge(String id) async {
    await _repository.completeChallenge(id);
  }
}

