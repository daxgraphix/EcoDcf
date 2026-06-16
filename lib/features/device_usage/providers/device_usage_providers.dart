import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';
import 'package:ecodcf/features/device_usage/data/repositories/device_usage_repository_impl.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/features/device_usage/domain/repositories/device_usage_repository.dart';

part 'device_usage_providers.g.dart';

@riverpod
Future<DeviceUsageRepository> deviceUsageRepository(DeviceUsageRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return DeviceUsageRepositoryImpl(isar);
}

@riverpod
Stream<List<DeviceUsage>> deviceUsageList(DeviceUsageListRef ref) async* {
  try {
    final repo = await ref.watch(deviceUsageRepositoryProvider.future);
    yield* repo.watchTodayUsage();
  } catch (e) {
    yield [];
  }
}

