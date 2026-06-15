import 'package:ecodcf/features/settings/domain/entities/settings.dart';
import 'package:ecodcf/features/settings/domain/repositories/settings_repository.dart';

abstract class GetSettingsUseCase {
  Future<AppSettings> call();
}

class GetSettingsUseCaseImpl implements GetSettingsUseCase {
  final SettingsRepository _repository;

  GetSettingsUseCaseImpl(this._repository);

  @override
  Future<AppSettings> call() => _repository.getSettings();
}

abstract class UpdateSettingsUseCase {
  Future<void> call(AppSettings settings);
}

class UpdateSettingsUseCaseImpl implements UpdateSettingsUseCase {
  final SettingsRepository _repository;

  UpdateSettingsUseCaseImpl(this._repository);

  @override
  Future<void> call(AppSettings settings) => _repository.updateSettings(settings);
}
