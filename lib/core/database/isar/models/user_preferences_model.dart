import 'package:isar/isar.dart';

part 'user_preferences_model.g.dart';

@collection
class UserPreferencesModel {
  Id id = Isar.autoIncrement;

  bool hasCompletedOnboarding = false;

  String? userName;

  String? themeMode; // 'light', 'dark', 'system'

  bool notificationsEnabled = true;

  DateTime? lastSyncTimestamp;
}
