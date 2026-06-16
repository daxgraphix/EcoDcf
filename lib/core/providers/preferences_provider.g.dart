// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userPreferencesRepositoryHash() =>
    r'16a53cd10e9bea42a549c5645d15bddba70877ca';

/// See also [userPreferencesRepository].
@ProviderFor(userPreferencesRepository)
final userPreferencesRepositoryProvider =
    FutureProvider<UserPreferencesRepository>.internal(
  userPreferencesRepository,
  name: r'userPreferencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPreferencesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserPreferencesRepositoryRef
    = FutureProviderRef<UserPreferencesRepository>;
String _$userPreferencesHash() => r'0974b344151be5df84c2eda68a1c84e74136399e';

/// See also [UserPreferences].
@ProviderFor(UserPreferences)
final userPreferencesProvider = AutoDisposeAsyncNotifierProvider<
    UserPreferences, UserPreferencesModel>.internal(
  UserPreferences.new,
  name: r'userPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPreferences = AutoDisposeAsyncNotifier<UserPreferencesModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
