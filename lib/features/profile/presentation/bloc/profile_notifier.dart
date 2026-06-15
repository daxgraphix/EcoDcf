import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/profile/domain/entities/profile.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileInitial());
}
