import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/challenges/domain/entities/challenge.dart';

final challengesProvider = StateNotifierProvider<ChallengesNotifier, ChallengesState>((ref) {
  return ChallengesNotifier();
});

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
}
