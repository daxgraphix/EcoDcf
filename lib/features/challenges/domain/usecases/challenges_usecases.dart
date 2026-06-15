import 'package:ecodcf/features/challenges/domain/entities/challenge.dart';
import 'package:ecodcf/features/challenges/domain/repositories/challenges_repository.dart';

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
