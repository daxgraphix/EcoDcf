import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/core/services/background_service.dart';

part 'initialization_provider.g.dart';

@riverpod
Future<void> appInitialization(AppInitializationRef ref) async {
  // Initialize Database
  await ref.read(isarProvider.future);
  
  // Initialize Background Services
  await BackgroundService.init();
  await BackgroundService.scheduleDeviceUsageUpdate();
  
  // Add other async initializations here (e.g., Firebase, Crashlytics)
}

