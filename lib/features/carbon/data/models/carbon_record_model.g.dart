// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carbon_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCarbonRecordModelCollection on Isar {
  IsarCollection<CarbonRecordModel> get carbonRecordModels => this.collection();
}

const CarbonRecordModelSchema = CollectionSchema(
  name: r'CarbonRecordModel',
  id: 3397946045100586195,
  properties: {
    r'carbonValue': PropertySchema(
      id: 0,
      name: r'carbonValue',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'metadataKeys': PropertySchema(
      id: 2,
      name: r'metadataKeys',
      type: IsarType.stringList,
    ),
    r'metadataValues': PropertySchema(
      id: 3,
      name: r'metadataValues',
      type: IsarType.stringList,
    ),
    r'remoteId': PropertySchema(
      id: 4,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 6,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _carbonRecordModelEstimateSize,
  serialize: _carbonRecordModelSerialize,
  deserialize: _carbonRecordModelDeserialize,
  deserializeProp: _carbonRecordModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _carbonRecordModelGetId,
  getLinks: _carbonRecordModelGetLinks,
  attach: _carbonRecordModelAttach,
  version: '3.1.0+1',
);

int _carbonRecordModelEstimateSize(
  CarbonRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.metadataKeys.length * 3;
  {
    for (var i = 0; i < object.metadataKeys.length; i++) {
      final value = object.metadataKeys[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.metadataValues.length * 3;
  {
    for (var i = 0; i < object.metadataValues.length; i++) {
      final value = object.metadataValues[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.remoteId.length * 3;
  bytesCount += 3 + object.type.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _carbonRecordModelSerialize(
  CarbonRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.carbonValue);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeStringList(offsets[2], object.metadataKeys);
  writer.writeStringList(offsets[3], object.metadataValues);
  writer.writeString(offsets[4], object.remoteId);
  writer.writeString(offsets[5], object.type);
  writer.writeString(offsets[6], object.unit);
}

CarbonRecordModel _carbonRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CarbonRecordModel();
  object.carbonValue = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.metadataKeys = reader.readStringList(offsets[2]) ?? [];
  object.metadataValues = reader.readStringList(offsets[3]) ?? [];
  object.remoteId = reader.readString(offsets[4]);
  object.type = reader.readString(offsets[5]);
  object.unit = reader.readString(offsets[6]);
  return object;
}

P _carbonRecordModelDeserializeProp<P>(
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
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _carbonRecordModelGetId(CarbonRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _carbonRecordModelGetLinks(
    CarbonRecordModel object) {
  return [];
}

void _carbonRecordModelAttach(
    IsarCollection<dynamic> col, Id id, CarbonRecordModel object) {
  object.id = id;
}

extension CarbonRecordModelQueryWhereSort
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QWhere> {
  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CarbonRecordModelQueryWhere
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QWhereClause> {
  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterWhereClause>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterWhereClause>
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

extension CarbonRecordModelQueryFilter
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QFilterCondition> {
  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      carbonValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbonValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      carbonValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbonValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      carbonValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbonValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      carbonValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbonValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metadataKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metadataKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metadataKeys',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metadataKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metadataKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metadataKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metadataKeys',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataKeys',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metadataKeys',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataKeys',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataKeys',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataKeys',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataKeys',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataKeys',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataKeysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataKeys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metadataValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metadataValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metadataValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metadataValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metadataValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metadataValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metadataValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadataValues',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metadataValues',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      metadataValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'metadataValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
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

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension CarbonRecordModelQueryObject
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QFilterCondition> {}

extension CarbonRecordModelQueryLinks
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QFilterCondition> {}

extension CarbonRecordModelQuerySortBy
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QSortBy> {
  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByCarbonValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonValue', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByCarbonValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonValue', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension CarbonRecordModelQuerySortThenBy
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QSortThenBy> {
  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByCarbonValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonValue', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByCarbonValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonValue', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension CarbonRecordModelQueryWhereDistinct
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct> {
  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct>
      distinctByCarbonValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbonValue');
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct>
      distinctByMetadataKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metadataKeys');
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct>
      distinctByMetadataValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metadataValues');
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CarbonRecordModel, CarbonRecordModel, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension CarbonRecordModelQueryProperty
    on QueryBuilder<CarbonRecordModel, CarbonRecordModel, QQueryProperty> {
  QueryBuilder<CarbonRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CarbonRecordModel, double, QQueryOperations>
      carbonValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbonValue');
    });
  }

  QueryBuilder<CarbonRecordModel, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CarbonRecordModel, List<String>, QQueryOperations>
      metadataKeysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metadataKeys');
    });
  }

  QueryBuilder<CarbonRecordModel, List<String>, QQueryOperations>
      metadataValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metadataValues');
    });
  }

  QueryBuilder<CarbonRecordModel, String, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<CarbonRecordModel, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<CarbonRecordModel, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
