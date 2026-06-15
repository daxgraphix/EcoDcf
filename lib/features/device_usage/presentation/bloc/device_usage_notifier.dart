import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/features/device_usage/data/repositories/device_usage_repository_impl.dart';
import 'package:ecodcf/core/providers/database/isar_provider.dart';

part 'device_usage_notifier.g.dart';

@riverpod
class DeviceUsageList extends _$DeviceUsageList {
  late final DeviceUsageRepositoryImpl _repository;

  @override
  Stream<List<DeviceUsage>> build() async* {
    final isar = await ref.watch(isarProvider.future);
    _repository = DeviceUsageRepositoryImpl(isar);
    yield* _repository.watchTodayUsage();
  }

  Future<void> addUsage(DeviceUsage usage) async {
    await _repository.saveUsage(usage);
  }
}

