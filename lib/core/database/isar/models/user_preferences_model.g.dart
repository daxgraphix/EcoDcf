// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserPreferencesModelCollection on Isar {
  IsarCollection<UserPreferencesModel> get userPreferencesModels =>
      this.collection();
}

const UserPreferencesModelSchema = CollectionSchema(
  name: r'UserPreferencesModel',
  id: 3603656307210587948,
  properties: {
    r'autoSyncEnabled': PropertySchema(
      id: 0,
      name: r'autoSyncEnabled',
      type: IsarType.bool,
    ),
    r'cloudSyncEnabled': PropertySchema(
      id: 1,
      name: r'cloudSyncEnabled',
      type: IsarType.bool,
    ),
    r'deviceTrackingEnabled': PropertySchema(
      id: 2,
      name: r'deviceTrackingEnabled',
      type: IsarType.bool,
    ),
    r'fontSizeScale': PropertySchema(
      id: 3,
      name: r'fontSizeScale',
      type: IsarType.double,
    ),
    r'hasCompletedOnboarding': PropertySchema(
      id: 4,
      name: r'hasCompletedOnboarding',
      type: IsarType.bool,
    ),
    r'highContrastEnabled': PropertySchema(
      id: 5,
      name: r'highContrastEnabled',
      type: IsarType.bool,
    ),
    r'lastSyncTimestamp': PropertySchema(
      id: 6,
      name: r'lastSyncTimestamp',
      type: IsarType.dateTime,
    ),
    r'notificationsEnabled': PropertySchema(
      id: 7,
      name: r'notificationsEnabled',
      type: IsarType.bool,
    ),
    r'reduceMotionEnabled': PropertySchema(
      id: 8,
      name: r'reduceMotionEnabled',
      type: IsarType.bool,
    ),
    r'themeMode': PropertySchema(
      id: 9,
      name: r'themeMode',
      type: IsarType.string,
    ),
    r'userName': PropertySchema(
      id: 10,
      name: r'userName',
      type: IsarType.string,
    )
  },
  estimateSize: _userPreferencesModelEstimateSize,
  serialize: _userPreferencesModelSerialize,
  deserialize: _userPreferencesModelDeserialize,
  deserializeProp: _userPreferencesModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userPreferencesModelGetId,
  getLinks: _userPreferencesModelGetLinks,
  attach: _userPreferencesModelAttach,
  version: '3.1.0+1',
);

int _userPreferencesModelEstimateSize(
  UserPreferencesModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.themeMode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userPreferencesModelSerialize(
  UserPreferencesModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.autoSyncEnabled);
  writer.writeBool(offsets[1], object.cloudSyncEnabled);
  writer.writeBool(offsets[2], object.deviceTrackingEnabled);
  writer.writeDouble(offsets[3], object.fontSizeScale);
  writer.writeBool(offsets[4], object.hasCompletedOnboarding);
  writer.writeBool(offsets[5], object.highContrastEnabled);
  writer.writeDateTime(offsets[6], object.lastSyncTimestamp);
  writer.writeBool(offsets[7], object.notificationsEnabled);
  writer.writeBool(offsets[8], object.reduceMotionEnabled);
  writer.writeString(offsets[9], object.themeMode);
  writer.writeString(offsets[10], object.userName);
}

UserPreferencesModel _userPreferencesModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserPreferencesModel();
  object.autoSyncEnabled = reader.readBool(offsets[0]);
  object.cloudSyncEnabled = reader.readBool(offsets[1]);
  object.deviceTrackingEnabled = reader.readBool(offsets[2]);
  object.fontSizeScale = reader.readDouble(offsets[3]);
  object.hasCompletedOnboarding = reader.readBool(offsets[4]);
  object.highContrastEnabled = reader.readBool(offsets[5]);
  object.id = id;
  object.lastSyncTimestamp = reader.readDateTimeOrNull(offsets[6]);
  object.notificationsEnabled = reader.readBool(offsets[7]);
  object.reduceMotionEnabled = reader.readBool(offsets[8]);
  object.themeMode = reader.readStringOrNull(offsets[9]);
  object.userName = reader.readStringOrNull(offsets[10]);
  return object;
}

P _userPreferencesModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userPreferencesModelGetId(UserPreferencesModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userPreferencesModelGetLinks(
    UserPreferencesModel object) {
  return [];
}

void _userPreferencesModelAttach(
    IsarCollection<dynamic> col, Id id, UserPreferencesModel object) {
  object.id = id;
}

extension UserPreferencesModelQueryWhereSort
    on QueryBuilder<UserPreferencesModel, UserPreferencesModel, QWhere> {
  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserPreferencesModelQueryWhere
    on QueryBuilder<UserPreferencesModel, UserPreferencesModel, QWhereClause> {
  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserPreferencesModelQueryFilter on QueryBuilder<UserPreferencesModel,
    UserPreferencesModel, QFilterCondition> {
  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> autoSyncEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoSyncEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> cloudSyncEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cloudSyncEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> deviceTrackingEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceTrackingEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> fontSizeScaleEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSizeScale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> fontSizeScaleGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSizeScale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> fontSizeScaleLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSizeScale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> fontSizeScaleBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSizeScale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> hasCompletedOnboardingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasCompletedOnboarding',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> highContrastEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highContrastEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> lastSyncTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncTimestamp',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> lastSyncTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncTimestamp',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> lastSyncTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> lastSyncTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> lastSyncTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> lastSyncTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> notificationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationsEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> reduceMotionEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reduceMotionEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'themeMode',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'themeMode',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
          QAfterFilterCondition>
      themeModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
          QAfterFilterCondition>
      themeModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'themeMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> themeModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userName',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
          QAfterFilterCondition>
      userNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
          QAfterFilterCondition>
      userNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel,
      QAfterFilterCondition> userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }
}

extension UserPreferencesModelQueryObject on QueryBuilder<UserPreferencesModel,
    UserPreferencesModel, QFilterCondition> {}

extension UserPreferencesModelQueryLinks on QueryBuilder<UserPreferencesModel,
    UserPreferencesModel, QFilterCondition> {}

extension UserPreferencesModelQuerySortBy
    on QueryBuilder<UserPreferencesModel, UserPreferencesModel, QSortBy> {
  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByAutoSyncEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSyncEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByAutoSyncEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSyncEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByCloudSyncEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudSyncEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByCloudSyncEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudSyncEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByDeviceTrackingEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceTrackingEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByDeviceTrackingEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceTrackingEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByFontSizeScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeScale', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByFontSizeScaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeScale', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByHasCompletedOnboarding() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedOnboarding', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByHasCompletedOnboardingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedOnboarding', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByHighContrastEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrastEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByHighContrastEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrastEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByLastSyncTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByReduceMotionEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotionEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByReduceMotionEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotionEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension UserPreferencesModelQuerySortThenBy
    on QueryBuilder<UserPreferencesModel, UserPreferencesModel, QSortThenBy> {
  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByAutoSyncEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSyncEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByAutoSyncEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSyncEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByCloudSyncEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudSyncEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByCloudSyncEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudSyncEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByDeviceTrackingEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceTrackingEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByDeviceTrackingEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceTrackingEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByFontSizeScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeScale', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByFontSizeScaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSizeScale', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByHasCompletedOnboarding() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedOnboarding', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByHasCompletedOnboardingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasCompletedOnboarding', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByHighContrastEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrastEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByHighContrastEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrastEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByLastSyncTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByReduceMotionEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotionEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByReduceMotionEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotionEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QAfterSortBy>
      thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension UserPreferencesModelQueryWhereDistinct
    on QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct> {
  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByAutoSyncEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoSyncEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByCloudSyncEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudSyncEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByDeviceTrackingEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceTrackingEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByFontSizeScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontSizeScale');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByHasCompletedOnboarding() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasCompletedOnboarding');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByHighContrastEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'highContrastEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncTimestamp');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByReduceMotionEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reduceMotionEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByThemeMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserPreferencesModel, UserPreferencesModel, QDistinct>
      distinctByUserName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }
}

extension UserPreferencesModelQueryProperty on QueryBuilder<
    UserPreferencesModel, UserPreferencesModel, QQueryProperty> {
  QueryBuilder<UserPreferencesModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      autoSyncEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoSyncEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      cloudSyncEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudSyncEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      deviceTrackingEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceTrackingEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, double, QQueryOperations>
      fontSizeScaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontSizeScale');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      hasCompletedOnboardingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasCompletedOnboarding');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      highContrastEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highContrastEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, DateTime?, QQueryOperations>
      lastSyncTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncTimestamp');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      notificationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, bool, QQueryOperations>
      reduceMotionEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reduceMotionEnabled');
    });
  }

  QueryBuilder<UserPreferencesModel, String?, QQueryOperations>
      themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }

  QueryBuilder<UserPreferencesModel, String?, QQueryOperations>
      userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}
