import 'package:isar/isar.dart';

part 'user_preferences_model.g.dart';

@collection
class UserPreferencesModel {
  Id id = Isar.autoIncrement;

  bool hasCompletedOnboarding = false;

  String? userName;

  String? themeMode; // 'light', 'dark', 'system'

  bool notificationsEnabled = true;

  // Accessibility
  double fontSizeScale = 1.0;
  bool highContrastEnabled = false;
  bool reduceMotionEnabled = false;

  // Carbon Tracking
  bool deviceTrackingEnabled = false;
  bool cloudSyncEnabled = false;
  bool autoSyncEnabled = true;

  DateTime? lastSyncTimestamp;
}
