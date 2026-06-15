import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUsageService {
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return {
        'deviceName': androidInfo.model,
        'deviceType': 'Android',
        'manufacturer': androidInfo.manufacturer,
        'model': androidInfo.model,
        'sdkVersion': androidInfo.version.release,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return {
        'deviceName': iosInfo.model,
        'deviceType': 'iOS',
        'systemName': iosInfo.systemName,
        'systemVersion': iosInfo.systemVersion,
        'deviceId': iosInfo.identifierForVendor,
      };
    }
    return {};
  }
}