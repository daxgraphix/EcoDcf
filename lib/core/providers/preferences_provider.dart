import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/database/isar/models/user_preferences_model.dart';
import 'package:ecodcf/core/database/isar/repositories/user_preferences_repository.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';

part 'preferences_provider.g.dart';

@Riverpod(keepAlive: true)
Future<UserPreferencesRepository> userPreferencesRepository(UserPreferencesRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return UserPreferencesRepository(isar);
}

@riverpod
class UserPreferences extends _$UserPreferences {
  late UserPreferencesRepository _repository;

  @override
  FutureOr<UserPreferencesModel> build() async {
    _repository = await ref.watch(userPreferencesRepositoryProvider.future);
    return _repository.getPreferences();
  }

  Future<void> completeOnboarding() async {
    await _repository.updateOnboardingStatus(true);
    ref.invalidateSelf();
  }

  Future<void> updateTheme(String mode) async {
    await _repository.updateThemeMode(mode);
    ref.invalidateSelf();
  }

  Future<void> updateAccessibility({
    double? fontSizeScale,
    bool? highContrast,
    bool? reduceMotion,
  }) async {
    await _repository.updateAccessibility(
      fontSizeScale: fontSizeScale,
      highContrast: highContrast,
      reduceMotion: reduceMotion,
    );
    ref.invalidateSelf();
  }

  Future<void> updateCarbonTracking({
    bool? deviceTracking,
    bool? cloudSync,
    bool? autoSync,
  }) async {
    await _repository.updateCarbonTracking(
      deviceTracking: deviceTracking,
      cloudSync: cloudSync,
      autoSync: autoSync,
    );
    ref.invalidateSelf();
  }

  Future<void> updateName(String name) async {
    await _repository.updateUserName(name);
    ref.invalidateSelf();
  }
}

