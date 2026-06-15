import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';

class EcoColors extends ThemeExtension<EcoColors> {
  final Color carbonHigh;
  final Color carbonMedium;
  final Color carbonLow;
  final Color goalReached;
  final Color streakActive;

  const EcoColors({
    required this.carbonHigh,
    required this.carbonMedium,
    required this.carbonLow,
    required this.goalReached,
    required this.streakActive,
  });

  @override
  ThemeExtension<EcoColors> copyWith({
    Color? carbonHigh,
    Color? carbonMedium,
    Color? carbonLow,
    Color? goalReached,
    Color? streakActive,
  }) {
    return EcoColors(
      carbonHigh: carbonHigh ?? this.carbonHigh,
      carbonMedium: carbonMedium ?? this.carbonMedium,
      carbonLow: carbonLow ?? this.carbonLow,
      goalReached: goalReached ?? this.goalReached,
      streakActive: streakActive ?? this.streakActive,
    );
  }

  @override
  ThemeExtension<EcoColors> lerp(ThemeExtension<EcoColors>? other, double t) {
    if (other is! EcoColors) return this;
    return EcoColors(
      carbonHigh: Color.lerp(carbonHigh, other.carbonHigh, t)!,
      carbonMedium: Color.lerp(carbonMedium, other.carbonMedium, t)!,
      carbonLow: Color.lerp(carbonLow, other.carbonLow, t)!,
      goalReached: Color.lerp(goalReached, other.goalReached, t)!,
      streakActive: Color.lerp(streakActive, other.streakActive, t)!,
    );
  }

  static const light = EcoColors(
    carbonHigh: AppColors.error,
    carbonMedium: AppColors.warning,
    carbonLow: AppColors.success,
    goalReached: AppColors.ecoBlue,
    streakActive: AppColors.gold,
  );

  static const dark = EcoColors(
    carbonHigh: Color(0xFFEF5350),
    carbonMedium: Color(0xFFFFB74D),
    carbonLow: Color(0xFF81C784),
    goalReached: Color(0xFF4FC3F7),
    streakActive: Color(0xFFFFD54F),
  );
}

