import 'package:ecodcf/features/device_usage/domain/entities/device_usage.dart';
import 'package:ecodcf/features/device_usage/domain/repositories/device_usage_repository.dart';

abstract class GetDeviceUsageUseCase {
  Future<List<DeviceUsage>> call();
}

class GetDeviceUsageUseCaseImpl implements GetDeviceUsageUseCase {
  final DeviceUsageRepository _repository;

  GetDeviceUsageUseCaseImpl(this._repository);

  @override
  Future<List<DeviceUsage>> call() => _repository.getAllUsage();
}

abstract class SaveDeviceUsageUseCase {
  Future<void> call(DeviceUsage usage);
}

class SaveDeviceUsageUseCaseImpl implements SaveDeviceUsageUseCase {
  final DeviceUsageRepository _repository;

  SaveDeviceUsageUseCaseImpl(this._repository);

  @override
  Future<void> call(DeviceUsage usage) => _repository.saveUsage(usage);
}

abstract class GetTotalDeviceCarbonUseCase {
  Future<double> call({DateTime? start, DateTime? end});
}

class GetTotalDeviceCarbonUseCaseImpl implements GetTotalDeviceCarbonUseCase {
  final DeviceUsageRepository _repository;

  GetTotalDeviceCarbonUseCaseImpl(this._repository);

  @override
  Future<double> call({DateTime? start, DateTime? end}) =>
      _repository.getTotalCarbonFootprint(start: start, end: end);
}
