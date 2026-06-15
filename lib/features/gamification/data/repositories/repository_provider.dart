import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/gamification/domain/repositories/gamification_repository.dart';
import 'package:ecodcf/features/gamification/data/repositories/challenges_repository_impl.dart';
import 'package:ecodcf/features/gamification/data/repositories/badges_repository_impl.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';

final challengesRepositoryProvider = Provider<ChallengesRepository>((ref) {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) throw Exception('Isar not initialized');
  return ChallengesRepositoryImpl(isar);
});

final badgesRepositoryProvider = Provider<BadgesRepository>((ref) {
  final isar = ref.watch(isarProvider).value;
  if (isar == null) throw Exception('Isar not initialized');
  return BadgesRepositoryImpl(isar);
});

