import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:ecodcf/core/design_system/typography/app_typography.dart';
import 'package:ecodcf/core/design_system/spacing.dart';
import 'package:ecodcf/core/design_system/radius.dart';

import 'package:ecodcf/core/theme/eco_colors_extension.dart';

class AppTheme {
  static final light = ThemeData(
    extensions: const [EcoColors.light],
    colorScheme: const ColorScheme.light(
      primary: AppColors.forestGreen,
      secondary: AppColors.ecoBlue,
      surface: AppColors.offWhite,
      onPrimary: AppColors.light,
      onSecondary: AppColors.light,
      onSurface: AppColors.dark,
    ),
    scaffoldBackgroundColor: AppColors.offWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.forestGreen,
      foregroundColor: AppColors.light,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.light,
      selectedItemColor: AppColors.forestGreen,
      unselectedItemColor: AppColors.grey600,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
      ),
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.forestGreen,
        foregroundColor: AppColors.light,
        padding: const EdgeInsets.all(AppSpacing.lg),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLarge,
      displayMedium: AppTypography.displayMedium,
      displaySmall: AppTypography.displaySmall,
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      headlineSmall: AppTypography.headlineSmall,
      titleLarge: AppTypography.titleLarge,
      titleMedium: AppTypography.titleMedium,
      titleSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.labelSmall,
    ),
  );
  
  static final dark = ThemeData(
    extensions: const [EcoColors.dark],
    colorScheme: const ColorScheme.dark(
      primary: AppColors.leafGreen,
      secondary: AppColors.ecoBlue,
      surface: AppColors.dark,
      onPrimary: AppColors.light,
      onSecondary: AppColors.light,
      onSurface: AppColors.offWhite,
    ),
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dark,
      foregroundColor: AppColors.light,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark,
      selectedItemColor: AppColors.leafGreen,
      unselectedItemColor: AppColors.grey500,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.dark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
      ),
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.leafGreen,
        foregroundColor: AppColors.light,
        padding: const EdgeInsets.all(AppSpacing.lg),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.displayLarge.copyWith(color: AppColors.light),
      displayMedium: AppTypography.displayMedium.copyWith(color: AppColors.light),
      displaySmall: AppTypography.displaySmall.copyWith(color: AppColors.light),
      headlineLarge: AppTypography.headlineLarge.copyWith(color: AppColors.light),
      headlineMedium: AppTypography.headlineMedium.copyWith(color: AppColors.light),
      headlineSmall: AppTypography.headlineSmall.copyWith(color: AppColors.light),
      titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.light),
      titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.light),
      titleSmall: AppTypography.titleSmall.copyWith(color: AppColors.light),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.offWhite),
      bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.grey300),
      bodySmall: AppTypography.bodySmall.copyWith(color: AppColors.grey500),
      labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.offWhite),
      labelMedium: AppTypography.labelMedium.copyWith(color: AppColors.grey300),
      labelSmall: AppTypography.labelSmall.copyWith(color: AppColors.grey500),
    ),
  );
}
