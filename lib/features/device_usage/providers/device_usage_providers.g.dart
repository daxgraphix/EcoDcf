// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_usage_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceUsageRepositoryHash() =>
    r'7ea52c1a040460ea28ad98b55845194237cea4a9';

/// See also [deviceUsageRepository].
@ProviderFor(deviceUsageRepository)
final deviceUsageRepositoryProvider =
    AutoDisposeFutureProvider<DeviceUsageRepository>.internal(
  deviceUsageRepository,
  name: r'deviceUsageRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceUsageRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceUsageRepositoryRef
    = AutoDisposeFutureProviderRef<DeviceUsageRepository>;
String _$deviceUsageListHash() => r'23645ed761ed7da49c60b36e59aecb3b7ac99528';

/// See also [deviceUsageList].
@ProviderFor(deviceUsageList)
final deviceUsageListProvider =
    AutoDisposeStreamProvider<List<DeviceUsage>>.internal(
  deviceUsageList,
  name: r'deviceUsageListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceUsageListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceUsageListRef = AutoDisposeStreamProviderRef<List<DeviceUsage>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
