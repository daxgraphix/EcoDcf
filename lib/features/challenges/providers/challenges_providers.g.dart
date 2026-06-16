// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengesRepositoryHash() =>
    r'189b9e7817793c8f92b38ce893f27f8aa9860f0a';

/// See also [challengesRepository].
@ProviderFor(challengesRepository)
final challengesRepositoryProvider =
    AutoDisposeFutureProvider<ChallengesRepository>.internal(
  challengesRepository,
  name: r'challengesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$challengesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChallengesRepositoryRef
    = AutoDisposeFutureProviderRef<ChallengesRepository>;
String _$challengesHash() => r'7e00945298eccdde7ac9ce2b4d57bd975be0493b';

/// See also [challenges].
@ProviderFor(challenges)
final challengesProvider = AutoDisposeFutureProvider<List<Challenge>>.internal(
  challenges,
  name: r'challengesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$challengesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChallengesRef = AutoDisposeFutureProviderRef<List<Challenge>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
