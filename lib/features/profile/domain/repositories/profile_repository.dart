import 'package:ecodcf/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
  Future<void> updateProfile(Profile profile);
  Future<void> updateAvatar(String avatarPath);
}
