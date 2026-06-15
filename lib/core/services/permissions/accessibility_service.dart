import 'package:shared_preferences/shared_preferences.dart';

class AccessibilityService {
  static const String _fontSizeKey = 'font_size_scale';
  static const String _highContrastKey = 'high_contrast';
  static const String _reduceMotionKey = 'reduce_motion';

  Future<double> getFontSizeScale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fontSizeKey) ?? 1.0;
  }

  Future<void> setFontSizeScale(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, value);
  }

  Future<bool> getHighContrast() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_highContrastKey) ?? false;
  }

  Future<void> setHighContrast(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_highContrastKey, value);
  }

  Future<bool> getReduceMotion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_reduceMotionKey) ?? false;
  }

  Future<void> setReduceMotion(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_reduceMotionKey, value);
  }
}