import 'package:equatable/equatable.dart';

class AppSettings extends Equatable {
  final String themeMode;
  final String language;
  final bool notificationsEnabled;
  final double carbonTarget;

  const AppSettings({
    this.themeMode = 'light',
    this.language = 'en',
    this.notificationsEnabled = true,
    this.carbonTarget = 100.0,
  });

  @override
  List<Object?> get props => [themeMode, language, notificationsEnabled, carbonTarget];

  AppSettings copyWith({String? themeMode, String? language, bool? notificationsEnabled, double? carbonTarget}) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      carbonTarget: carbonTarget ?? this.carbonTarget,
    );
  }
}