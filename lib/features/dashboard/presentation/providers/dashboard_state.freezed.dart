// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardData {
  List<CarbonRecord> get carbonRecords => throw _privateConstructorUsedError;
  List<DeviceUsage> get deviceUsages => throw _privateConstructorUsedError;
  List<Challenge> get activeChallenges => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {List<CarbonRecord> carbonRecords,
      List<DeviceUsage> deviceUsages,
      List<Challenge> activeChallenges,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carbonRecords = null,
    Object? deviceUsages = null,
    Object? activeChallenges = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      carbonRecords: null == carbonRecords
          ? _value.carbonRecords
          : carbonRecords // ignore: cast_nullable_to_non_nullable
              as List<CarbonRecord>,
      deviceUsages: null == deviceUsages
          ? _value.deviceUsages
          : deviceUsages // ignore: cast_nullable_to_non_nullable
              as List<DeviceUsage>,
      activeChallenges: null == activeChallenges
          ? _value.activeChallenges
          : activeChallenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CarbonRecord> carbonRecords,
      List<DeviceUsage> deviceUsages,
      List<Challenge> activeChallenges,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carbonRecords = null,
    Object? deviceUsages = null,
    Object? activeChallenges = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DashboardDataImpl(
      carbonRecords: null == carbonRecords
          ? _value._carbonRecords
          : carbonRecords // ignore: cast_nullable_to_non_nullable
              as List<CarbonRecord>,
      deviceUsages: null == deviceUsages
          ? _value._deviceUsages
          : deviceUsages // ignore: cast_nullable_to_non_nullable
              as List<DeviceUsage>,
      activeChallenges: null == activeChallenges
          ? _value._activeChallenges
          : activeChallenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {required final List<CarbonRecord> carbonRecords,
      required final List<DeviceUsage> deviceUsages,
      required final List<Challenge> activeChallenges,
      this.isLoading = false,
      this.errorMessage})
      : _carbonRecords = carbonRecords,
        _deviceUsages = deviceUsages,
        _activeChallenges = activeChallenges;

  final List<CarbonRecord> _carbonRecords;
  @override
  List<CarbonRecord> get carbonRecords {
    if (_carbonRecords is EqualUnmodifiableListView) return _carbonRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carbonRecords);
  }

  final List<DeviceUsage> _deviceUsages;
  @override
  List<DeviceUsage> get deviceUsages {
    if (_deviceUsages is EqualUnmodifiableListView) return _deviceUsages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deviceUsages);
  }

  final List<Challenge> _activeChallenges;
  @override
  List<Challenge> get activeChallenges {
    if (_activeChallenges is EqualUnmodifiableListView)
      return _activeChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeChallenges);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DashboardData(carbonRecords: $carbonRecords, deviceUsages: $deviceUsages, activeChallenges: $activeChallenges, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            const DeepCollectionEquality()
                .equals(other._carbonRecords, _carbonRecords) &&
            const DeepCollectionEquality()
                .equals(other._deviceUsages, _deviceUsages) &&
            const DeepCollectionEquality()
                .equals(other._activeChallenges, _activeChallenges) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_carbonRecords),
      const DeepCollectionEquality().hash(_deviceUsages),
      const DeepCollectionEquality().hash(_activeChallenges),
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
      {required final List<CarbonRecord> carbonRecords,
      required final List<DeviceUsage> deviceUsages,
      required final List<Challenge> activeChallenges,
      final bool isLoading,
      final String? errorMessage}) = _$DashboardDataImpl;

  @override
  List<CarbonRecord> get carbonRecords;
  @override
  List<DeviceUsage> get deviceUsages;
  @override
  List<Challenge> get activeChallenges;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
