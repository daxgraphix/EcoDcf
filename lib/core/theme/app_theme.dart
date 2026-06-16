import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/core/design_system/typography/app_typography.dart';
import 'package:ecodcf/core/design_system/spacing.dart';
import 'package:ecodcf/core/design_system/radius.dart';

import 'package:ecodcf/core/theme/eco_colors_extension.dart';

class AppTheme {
  static ThemeData lightTheme(ColorScheme? dynamicColorScheme) {
    final colorScheme = dynamicColorScheme ?? ColorScheme.fromSeed(
      seedColor: AppColors.forestGreen,
      primary: AppColors.forestGreen,
      secondary: AppColors.ecoBlue,
      surface: AppColors.offWhite,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: const [EcoColors.light],
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        ),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.all(AppSpacing.lg),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      textTheme: _textTheme(colorScheme),
    );
  }

  static ThemeData darkTheme(ColorScheme? dynamicColorScheme) {
    final colorScheme = dynamicColorScheme ?? ColorScheme.fromSeed(
      seedColor: AppColors.forestGreen,
      brightness: Brightness.dark,
      primary: AppColors.leafGreen,
      secondary: AppColors.ecoBlue,
      surface: AppColors.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: const [EcoColors.dark],
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        ),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.all(AppSpacing.lg),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      textTheme: _textTheme(colorScheme),
    );
  }

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
    displayLarge: AppTypography.displayLarge.copyWith(color: colorScheme.onSurface),
    displayMedium: AppTypography.displayMedium.copyWith(color: colorScheme.onSurface),
    displaySmall: AppTypography.displaySmall.copyWith(color: colorScheme.onSurface),
    headlineLarge: AppTypography.headlineLarge.copyWith(color: colorScheme.onSurface),
    headlineMedium: AppTypography.headlineMedium.copyWith(color: colorScheme.onSurface),
    headlineSmall: AppTypography.headlineSmall.copyWith(color: colorScheme.onSurface),
    titleLarge: AppTypography.titleLarge.copyWith(color: colorScheme.onSurface),
    titleMedium: AppTypography.titleMedium.copyWith(color: colorScheme.onSurface),
    titleSmall: AppTypography.titleSmall.copyWith(color: colorScheme.onSurface),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: colorScheme.onSurface),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: colorScheme.onSurfaceVariant),
    bodySmall: AppTypography.bodySmall.copyWith(color: colorScheme.onSurfaceVariant),
    labelLarge: AppTypography.labelLarge.copyWith(color: colorScheme.onSurface),
    labelMedium: AppTypography.labelMedium.copyWith(color: colorScheme.onSurfaceVariant),
    labelSmall: AppTypography.labelSmall.copyWith(color: colorScheme.onSurfaceVariant),
  );
}
