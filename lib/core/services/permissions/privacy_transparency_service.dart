import 'package:permission_handler/permission_handler.dart';

class PermissionRequirement {
  final String title;
  final String description;
  final String dataCollected;
  final String justification;
  final Permission permission;

  PermissionRequirement({
    required this.title,
    required this.description,
    required this.dataCollected,
    required this.justification,
    required this.permission,
  });
}

class PrivacyTransparencyService {
  final List<PermissionRequirement> requirements = [
    PermissionRequirement(
      title: 'Device Usage Tracking',
      description: 'To calculate your digital carbon footprint, we need to monitor how much time you spend on your device.',
      dataCollected: 'Screen time, active hours, and device power state.',
      justification: 'This is the primary source for calculating energy-related CO2 emissions.',
      permission: Permission.ignoreBatteryOptimizations, // Example for background work
    ),
    PermissionRequirement(
      title: 'Notifications',
      description: 'Stay updated on your D-Score and sustainability challenges.',
      dataCollected: 'No behavioral data collected through notifications.',
      justification: 'Helps maintain engagement and provides real-time alerts when you exceed carbon targets.',
      permission: Permission.notification,
    ),
    // Add more as needed (e.g., Activity Recognition for physical movement vs digital)
  ];

  Future<Map<Permission, PermissionStatus>> getPermissionStatuses() async {
    final Map<Permission, PermissionStatus> statuses = {};
    for (var req in requirements) {
      statuses[req.permission] = await req.permission.status;
    }
    return statuses;
  }

  Future<PermissionStatus> requestPermission(Permission permission) async {
    return await permission.request();
  }

  /// Returns a detailed transparency report on how a specific module's data is handled.
  Map<String, String> getModuleTransparency(String moduleType) {
    switch (moduleType) {
      case 'carbon_tracking':
        return {
          'Storage': 'Data is stored securely on your device.',
          'Sync': 'Data stays on your device. Cloud sync is optional and encrypted.',
          'Privacy': 'We never track specific app names or content, only categories and time.',
        };
      default:
        return {'General': 'All digital activity data is processed offline-first.'};
    }
  }
}
