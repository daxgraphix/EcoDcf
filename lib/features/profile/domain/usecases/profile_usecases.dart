import 'package:ecodcf/features/profile/domain/entities/profile.dart';
import 'package:ecodcf/features/profile/domain/repositories/profile_repository.dart';

abstract class GetProfileUseCase {
  Future<Profile> call();
}

class GetProfileUseCaseImpl implements GetProfileUseCase {
  final ProfileRepository _repository;

  GetProfileUseCaseImpl(this._repository);

  @override
  Future<Profile> call() => _repository.getProfile();
}

abstract class UpdateProfileUseCase {
  Future<void> call(Profile profile);
}

class UpdateProfileUseCaseImpl implements UpdateProfileUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCaseImpl(this._repository);

  @override
  Future<void> call(Profile profile) => _repository.updateProfile(profile);
}
