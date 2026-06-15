import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/providers/preferences_provider.dart';

final appThemeProvider = Provider<String>((ref) {
  final prefs = ref.watch(userPreferencesProvider).value;
  return prefs?.themeMode ?? 'light';
});

