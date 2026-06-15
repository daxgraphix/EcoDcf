import 'package:ecodcf/features/settings/domain/entities/settings.dart';
import 'package:ecodcf/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<AppSettings> getSettings() async {
    return const AppSettings();
  }

  @override
  Future<void> updateSettings(AppSettings settings) async {}
}
