import 'package:ecodcf/features/gamification/domain/entities/challenge.dart';
import 'package:ecodcf/features/gamification/domain/repositories/gamification_repository.dart';

abstract class GetChallengesUseCase {
  Future<List<Challenge>> call();
}

class GetChallengesUseCaseImpl implements GetChallengesUseCase {
  final ChallengesRepository _repository;

  GetChallengesUseCaseImpl(this._repository);

  @override
  Future<List<Challenge>> call() => _repository.getAllChallenges();
}

abstract class CompleteChallengeUseCase {
  Future<void> call(String id);
}

class CompleteChallengeUseCaseImpl implements CompleteChallengeUseCase {
  final ChallengesRepository _repository;

  CompleteChallengeUseCaseImpl(this._repository);

  @override
  Future<void> call(String id) => _repository.completeChallenge(id);
}

abstract class GetBadgesUseCase {
  Future<List<GamificationBadge>> call();
}

class GetBadgesUseCaseImpl implements GetBadgesUseCase {
  final BadgesRepository _repository;

  GetBadgesUseCaseImpl(this._repository);

  @override
  Future<List<GamificationBadge>> call() => _repository.getAllBadges();
}

abstract class UnlockBadgeUseCase {
  Future<void> call(String id);
}

class UnlockBadgeUseCaseImpl implements UnlockBadgeUseCase {
  final BadgesRepository _repository;

  UnlockBadgeUseCaseImpl(this._repository);

  @override
  Future<void> call(String id) => _repository.unlockBadge(id);
}
