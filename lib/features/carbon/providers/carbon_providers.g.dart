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
    r'0706ccb98ed4a561e91e762f3a20f8648446e25e';

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
String _$singleRecordHash() => r'8fa3ee4b0e61cda5cf9a625fbbae783265bfcf58';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [singleRecord].
@ProviderFor(singleRecord)
const singleRecordProvider = SingleRecordFamily();

/// See also [singleRecord].
class SingleRecordFamily extends Family<AsyncValue<CarbonRecord>> {
  /// See also [singleRecord].
  const SingleRecordFamily();

  /// See also [singleRecord].
  SingleRecordProvider call(
    String id,
  ) {
    return SingleRecordProvider(
      id,
    );
  }

  @override
  SingleRecordProvider getProviderOverride(
    covariant SingleRecordProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'singleRecordProvider';
}

/// See also [singleRecord].
class SingleRecordProvider extends AutoDisposeFutureProvider<CarbonRecord> {
  /// See also [singleRecord].
  SingleRecordProvider(
    String id,
  ) : this._internal(
          (ref) => singleRecord(
            ref as SingleRecordRef,
            id,
          ),
          from: singleRecordProvider,
          name: r'singleRecordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleRecordHash,
          dependencies: SingleRecordFamily._dependencies,
          allTransitiveDependencies:
              SingleRecordFamily._allTransitiveDependencies,
          id: id,
        );

  SingleRecordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<CarbonRecord> Function(SingleRecordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleRecordProvider._internal(
        (ref) => create(ref as SingleRecordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CarbonRecord> createElement() {
    return _SingleRecordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleRecordProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SingleRecordRef on AutoDisposeFutureProviderRef<CarbonRecord> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SingleRecordProviderElement
    extends AutoDisposeFutureProviderElement<CarbonRecord>
    with SingleRecordRef {
  _SingleRecordProviderElement(super.provider);

  @override
  String get id => (origin as SingleRecordProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
