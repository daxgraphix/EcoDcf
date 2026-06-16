import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/challenges/domain/entities/challenge.dart';
import 'package:ecodcf/features/challenges/domain/repositories/challenges_repository.dart';

abstract class ChallengesState {}

class ChallengesInitial extends ChallengesState {}

class ChallengesLoading extends ChallengesState {}

class ChallengesLoaded extends ChallengesState {
  final List<Challenge> challenges;

  ChallengesLoaded(this.challenges);
}

class ChallengesError extends ChallengesState {
  final String message;

  ChallengesError(this.message);
}

class ChallengesNotifier extends StateNotifier<ChallengesState> {
  ChallengesNotifier() : super(ChallengesInitial());
  
  Future<void> loadChallenges(ChallengesRepository repository) async {
    try {
      final challenges = await repository.getAllChallenges();
      state = ChallengesLoaded(challenges);
    } catch (e) {
      state = ChallengesError('Failed to load challenges');
    }
  }
}
