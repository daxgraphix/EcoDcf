// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carbon_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carbonRepositoryHash() => r'abd9abe0cc69aba2c9339a9ad2ea196ce0c1e88c';

/// See also [carbonRepository].
@ProviderFor(carbonRepository)
final carbonRepositoryProvider =
    AutoDisposeFutureProvider<CarbonRepository>.internal(
  carbonRepository,
  name: r'carbonRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carbonRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CarbonRepositoryRef = AutoDisposeFutureProviderRef<CarbonRepository>;
String _$carbonRecordsStreamHash() =>
    r'9e9382fa82fc16bac6f13ddcc3f26f4292a1a9ea';

/// See also [carbonRecordsStream].
@ProviderFor(carbonRecordsStream)
final carbonRecordsStreamProvider =
    AutoDisposeStreamProvider<List<CarbonRecord>>.internal(
  carbonRecordsStream,
  name: r'carbonRecordsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carbonRecordsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CarbonRecordsStreamRef
    = AutoDisposeStreamProviderRef<List<CarbonRecord>>;
String _$recentRecordsHash() => r'b5bb677a4c3e74e9554a306c5993615d7b18d548';

/// See also [recentRecords].
@ProviderFor(recentRecords)
final recentRecordsProvider =
    AutoDisposeFutureProvider<List<CarbonRecord>>.internal(
  recentRecords,
  name: r'recentRecordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecentRecordsRef = AutoDisposeFutureProviderRef<List<CarbonRecord>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
