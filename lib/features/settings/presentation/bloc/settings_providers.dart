import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/services/permissions/permission_service.dart';
import 'package:ecodcf/core/services/permissions/accessibility_service.dart';

final permissionServiceProvider = Provider((ref) => PermissionService());
final accessibilityServiceProvider = Provider((ref) => AccessibilityService());

final accessibilityStateProvider = StateNotifierProvider<AccessibilityNotifier, AccessibilityState>((ref) {
  return AccessibilityNotifier(ref.read(accessibilityServiceProvider));
});

class AccessibilityState {
  final double fontSizeScale;
  final bool highContrast;
  final bool reduceMotion;

  AccessibilityState({
    this.fontSizeScale = 1.0,
    this.highContrast = false,
    this.reduceMotion = false,
  });

  AccessibilityState copyWith({double? fontSizeScale, bool? highContrast, bool? reduceMotion}) {
    return AccessibilityState(
      fontSizeScale: fontSizeScale ?? this.fontSizeScale,
      highContrast: highContrast ?? this.highContrast,
      reduceMotion: reduceMotion ?? this.reduceMotion,
    );
  }
}

class AccessibilityNotifier extends StateNotifier<AccessibilityState> {
  final AccessibilityService _service;

  AccessibilityNotifier(this._service) : super(AccessibilityState());

  Future<void> init() async {
    state = state.copyWith(
      fontSizeScale: await _service.getFontSizeScale(),
      highContrast: await _service.getHighContrast(),
      reduceMotion: await _service.getReduceMotion(),
    );
  }

  Future<void> setFontSizeScale(double value) async {
    await _service.setFontSizeScale(value);
    state = state.copyWith(fontSizeScale: value);
  }

  Future<void> setHighContrast(bool value) async {
    await _service.setHighContrast(value);
    state = state.copyWith(highContrast: value);
  }

  Future<void> setReduceMotion(bool value) async {
    await _service.setReduceMotion(value);
    state = state.copyWith(reduceMotion: value);
  }
}
