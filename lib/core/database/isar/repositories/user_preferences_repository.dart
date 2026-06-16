import 'package:isar/isar.dart';
import 'package:ecodcf/core/database/isar/models/user_preferences_model.dart';

class UserPreferencesRepository {
  final Isar _isar;

  UserPreferencesRepository(this._isar);

  Future<UserPreferencesModel> getPreferences() async {
    final prefs = await _isar.userPreferencesModels.where().findFirst();
    if (prefs == null) {
      final initial = UserPreferencesModel();
      await _isar.writeTxn(() async {
        await _isar.userPreferencesModels.put(initial);
      });
      return initial;
    }
    return prefs;
  }

  Future<void> updateOnboardingStatus(bool completed) async {
    final prefs = await getPreferences();
    await _isar.writeTxn(() async {
      prefs.hasCompletedOnboarding = completed;
      await _isar.userPreferencesModels.put(prefs);
    });
  }

  Future<void> updateThemeMode(String mode) async {
    final prefs = await getPreferences();
    await _isar.writeTxn(() async {
      prefs.themeMode = mode;
      await _isar.userPreferencesModels.put(prefs);
    });
  }

  Future<void> updateAccessibility({
    double? fontSizeScale,
    bool? highContrast,
    bool? reduceMotion,
  }) async {
    final prefs = await getPreferences();
    await _isar.writeTxn(() async {
      if (fontSizeScale != null) prefs.fontSizeScale = fontSizeScale;
      if (highContrast != null) prefs.highContrastEnabled = highContrast;
      if (reduceMotion != null) prefs.reduceMotionEnabled = reduceMotion;
      await _isar.userPreferencesModels.put(prefs);
    });
  }

  Future<void> updateCarbonTracking({
    bool? deviceTracking,
    bool? cloudSync,
    bool? autoSync,
  }) async {
    final prefs = await getPreferences();
    await _isar.writeTxn(() async {
      if (deviceTracking != null) prefs.deviceTrackingEnabled = deviceTracking;
      if (cloudSync != null) prefs.cloudSyncEnabled = cloudSync;
      if (autoSync != null) prefs.autoSyncEnabled = autoSync;
      await _isar.userPreferencesModels.put(prefs);
    });
  }

  Future<void> updateNotifications(bool enabled) async {
    final prefs = await getPreferences();
    await _isar.writeTxn(() async {
      prefs.notificationsEnabled = enabled;
      await _isar.userPreferencesModels.put(prefs);
    });
  }

  Future<void> updateUserName(String name) async {
    final prefs = await getPreferences();
    await _isar.writeTxn(() async {
      prefs.userName = name;
      await _isar.userPreferencesModels.put(prefs);
    });
  }
}

