import 'package:ecodcf/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> getSettings();
  Future<void> updateSettings(AppSettings settings);
}
