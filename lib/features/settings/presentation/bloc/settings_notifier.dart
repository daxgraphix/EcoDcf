import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/features/settings/domain/entities/settings.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final AppSettings settings;

  SettingsLoaded(this.settings);
}

class SettingsError extends SettingsState {
  final String message;

  SettingsError(this.message);
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(SettingsInitial());
}
