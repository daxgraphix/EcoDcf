import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class PermissionService {
  static const MethodChannel _channel = MethodChannel('ecodcf/permissions');

  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  Future<bool> requestUsageAccess() async {
    try {
      final result = await _channel.invokeMethod('requestUsageAccess');
      return result == true;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> checkUsageAccessPermission() async {
    try {
      final result = await _channel.invokeMethod('checkUsageAccess');
      return result == true;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> requestBatteryOptimizationExemption() async {
    try {
      final result = await _channel.invokeMethod('requestBatteryExemption');
      return result == true;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> checkBatteryOptimization() async {
    try {
      final result = await _channel.invokeMethod('isBatteryOptimized');
      return result == true;
    } on PlatformException {
      return true;
    }
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}