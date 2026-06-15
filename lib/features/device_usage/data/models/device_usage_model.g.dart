// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_usage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeviceUsageModelCollection on Isar {
  IsarCollection<DeviceUsageModel> get deviceUsageModels => this.collection();
}

const DeviceUsageModelSchema = CollectionSchema(
  name: r'DeviceUsageModel',
  id: -5410771832659288443,
  properties: {
    r'activeHours': PropertySchema(
      id: 0,
      name: r'activeHours',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'deviceName': PropertySchema(
      id: 2,
      name: r'deviceName',
      type: IsarType.string,
    ),
    r'deviceType': PropertySchema(
      id: 3,
      name: r'deviceType',
      type: IsarType.string,
    ),
    r'powerConsumptionWatts': PropertySchema(
      id: 4,
      name: r'powerConsumptionWatts',
      type: IsarType.double,
    ),
    r'remoteId': PropertySchema(
      id: 5,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'screenTimeMinutes': PropertySchema(
      id: 6,
      name: r'screenTimeMinutes',
      type: IsarType.double,
    )
  },
  estimateSize: _deviceUsageModelEstimateSize,
  serialize: _deviceUsageModelSerialize,
  deserialize: _deviceUsageModelDeserialize,
  deserializeProp: _deviceUsageModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _deviceUsageModelGetId,
  getLinks: _deviceUsageModelGetLinks,
  attach: _deviceUsageModelAttach,
  version: '3.1.0+1',
);

int _deviceUsageModelEstimateSize(
  DeviceUsageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceName.length * 3;
  bytesCount += 3 + object.deviceType.length * 3;
  bytesCount += 3 + object.remoteId.length * 3;
  return bytesCount;
}

void _deviceUsageModelSerialize(
  DeviceUsageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.activeHours);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.deviceName);
  writer.writeString(offsets[3], object.deviceType);
  writer.writeDouble(offsets[4], object.powerConsumptionWatts);
  writer.writeString(offsets[5], object.remoteId);
  writer.writeDouble(offsets[6], object.screenTimeMinutes);
}

DeviceUsageModel _deviceUsageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeviceUsageModel();
  object.activeHours = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.deviceName = reader.readString(offsets[2]);
  object.deviceType = reader.readString(offsets[3]);
  object.id = id;
  object.powerConsumptionWatts = reader.readDouble(offsets[4]);
  object.remoteId = reader.readString(offsets[5]);
  object.screenTimeMinutes = reader.readDouble(offsets[6]);
  return object;
}

P _deviceUsageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deviceUsageModelGetId(DeviceUsageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deviceUsageModelGetLinks(DeviceUsageModel object) {
  return [];
}

void _deviceUsageModelAttach(
    IsarCollection<dynamic> col, Id id, DeviceUsageModel object) {
  object.id = id;
}

extension DeviceUsageModelQueryWhereSort
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QWhere> {
  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceUsageModelQueryWhere
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QWhereClause> {
  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterWhereClause>
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

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterWhereClause> idBetween(
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

extension DeviceUsageModelQueryFilter
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QFilterCondition> {
  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      activeHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      activeHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      activeHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      activeHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceName',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceName',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceType',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      deviceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceType',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      powerConsumptionWattsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'powerConsumptionWatts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      powerConsumptionWattsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'powerConsumptionWatts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      powerConsumptionWattsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'powerConsumptionWatts',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      powerConsumptionWattsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'powerConsumptionWatts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      screenTimeMinutesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'screenTimeMinutes',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      screenTimeMinutesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'screenTimeMinutes',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      screenTimeMinutesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'screenTimeMinutes',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterFilterCondition>
      screenTimeMinutesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'screenTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DeviceUsageModelQueryObject
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QFilterCondition> {}

extension DeviceUsageModelQueryLinks
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QFilterCondition> {}

extension DeviceUsageModelQuerySortBy
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QSortBy> {
  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByActiveHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeHours', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByActiveHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeHours', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByDeviceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByDeviceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByDeviceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByDeviceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByPowerConsumptionWatts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerConsumptionWatts', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByPowerConsumptionWattsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerConsumptionWatts', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByScreenTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      sortByScreenTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenTimeMinutes', Sort.desc);
    });
  }
}

extension DeviceUsageModelQuerySortThenBy
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QSortThenBy> {
  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByActiveHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeHours', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByActiveHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeHours', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByDeviceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByDeviceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByDeviceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByDeviceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByPowerConsumptionWatts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerConsumptionWatts', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByPowerConsumptionWattsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'powerConsumptionWatts', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByScreenTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QAfterSortBy>
      thenByScreenTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenTimeMinutes', Sort.desc);
    });
  }
}

extension DeviceUsageModelQueryWhereDistinct
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct> {
  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct>
      distinctByActiveHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeHours');
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct>
      distinctByDeviceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct>
      distinctByDeviceType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct>
      distinctByPowerConsumptionWatts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'powerConsumptionWatts');
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceUsageModel, DeviceUsageModel, QDistinct>
      distinctByScreenTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'screenTimeMinutes');
    });
  }
}

extension DeviceUsageModelQueryProperty
    on QueryBuilder<DeviceUsageModel, DeviceUsageModel, QQueryProperty> {
  QueryBuilder<DeviceUsageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DeviceUsageModel, double, QQueryOperations>
      activeHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeHours');
    });
  }

  QueryBuilder<DeviceUsageModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DeviceUsageModel, String, QQueryOperations>
      deviceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceName');
    });
  }

  QueryBuilder<DeviceUsageModel, String, QQueryOperations>
      deviceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceType');
    });
  }

  QueryBuilder<DeviceUsageModel, double, QQueryOperations>
      powerConsumptionWattsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'powerConsumptionWatts');
    });
  }

  QueryBuilder<DeviceUsageModel, String, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<DeviceUsageModel, double, QQueryOperations>
      screenTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'screenTimeMinutes');
    });
  }
}
