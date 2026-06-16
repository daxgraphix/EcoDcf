import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/features/challenges/data/repositories/challenges_repository_impl.dart';
import 'package:ecodcf/features/challenges/domain/repositories/challenges_repository.dart';
import 'package:ecodcf/features/challenges/domain/entities/challenge.dart';

part 'challenges_providers.g.dart';

@riverpod
Future<ChallengesRepository> challengesRepository(ChallengesRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return ChallengesRepositoryImpl(isar);
}

@riverpod
Future<List<Challenge>> challenges(ChallengesRef ref) async {
  final repository = await ref.watch(challengesRepositoryProvider.future);
  return repository.getAllChallenges();
}

