import 'package:ecodcf/features/profile/domain/entities/profile.dart';
import 'package:ecodcf/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Profile> getProfile() async {
    return Profile(
      id: '',
      name: '',
      email: '',
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<void> updateProfile(Profile profile) async {}

  @override
  Future<void> updateAvatar(String avatarPath) async {}
}
