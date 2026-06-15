import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecodcf/core/services/permissions/privacy_transparency_service.dart';

final privacyServiceProvider = Provider<PrivacyTransparencyService>((ref) {
  return PrivacyTransparencyService();
});

final permissionStatusProvider = FutureProvider.family<bool, dynamic>((ref, permission) async {
  final status = await (permission as dynamic).status;
  return status.isGranted;
});

