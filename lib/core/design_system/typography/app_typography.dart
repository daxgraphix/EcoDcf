import 'package:flutter/material.dart';

class AppTypography {
  static const String interFamily = 'Inter';
  static const String poppinsFamily = 'Poppins';
  
  static const _inter = TextStyle(fontFamily: interFamily);
  static const _poppins = TextStyle(fontFamily: poppinsFamily);
  
  static final displayLarge = _inter.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.12,
  );
  
  static final displayMedium = _inter.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    height: 1.18,
  );
  
  static final displaySmall = _inter.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.22,
  );
  
  static final headlineLarge = _poppins.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  
  static final headlineMedium = _poppins.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.29,
  );
  
  static final headlineSmall = _poppins.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33,
  );
  
  static final titleLarge = _poppins.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
  );
  
  static final titleMedium = _poppins.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.44,
  );
  
  static final titleSmall = _poppins.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.50,
  );
  
  static final bodyLarge = _inter.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.50,
  );
  
  static final bodyMedium = _inter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
  );
  
  static final bodySmall = _inter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
  );
  
  static final labelLarge = _poppins.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
  );
  
  static final labelMedium = _poppins.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
  );
  
  static final labelSmall = _poppins.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
  );
}