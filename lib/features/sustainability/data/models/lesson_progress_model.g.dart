// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_progress_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLessonProgressModelCollection on Isar {
  IsarCollection<LessonProgressModel> get lessonProgressModels =>
      this.collection();
}

const LessonProgressModelSchema = CollectionSchema(
  name: r'LessonProgressModel',
  id: 7384122619474931484,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 1,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'lessonId': PropertySchema(
      id: 2,
      name: r'lessonId',
      type: IsarType.string,
    )
  },
  estimateSize: _lessonProgressModelEstimateSize,
  serialize: _lessonProgressModelSerialize,
  deserialize: _lessonProgressModelDeserialize,
  deserializeProp: _lessonProgressModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'lessonId': IndexSchema(
      id: 2130166291500416829,
      name: r'lessonId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'lessonId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _lessonProgressModelGetId,
  getLinks: _lessonProgressModelGetLinks,
  attach: _lessonProgressModelAttach,
  version: '3.1.0+1',
);

int _lessonProgressModelEstimateSize(
  LessonProgressModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lessonId.length * 3;
  return bytesCount;
}

void _lessonProgressModelSerialize(
  LessonProgressModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeBool(offsets[1], object.isCompleted);
  writer.writeString(offsets[2], object.lessonId);
}

LessonProgressModel _lessonProgressModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LessonProgressModel();
  object.completedAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[1]);
  object.lessonId = reader.readString(offsets[2]);
  return object;
}

P _lessonProgressModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lessonProgressModelGetId(LessonProgressModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lessonProgressModelGetLinks(
    LessonProgressModel object) {
  return [];
}

void _lessonProgressModelAttach(
    IsarCollection<dynamic> col, Id id, LessonProgressModel object) {
  object.id = id;
}

extension LessonProgressModelByIndex on IsarCollection<LessonProgressModel> {
  Future<LessonProgressModel?> getByLessonId(String lessonId) {
    return getByIndex(r'lessonId', [lessonId]);
  }

  LessonProgressModel? getByLessonIdSync(String lessonId) {
    return getByIndexSync(r'lessonId', [lessonId]);
  }

  Future<bool> deleteByLessonId(String lessonId) {
    return deleteByIndex(r'lessonId', [lessonId]);
  }

  bool deleteByLessonIdSync(String lessonId) {
    return deleteByIndexSync(r'lessonId', [lessonId]);
  }

  Future<List<LessonProgressModel?>> getAllByLessonId(
      List<String> lessonIdValues) {
    final values = lessonIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'lessonId', values);
  }

  List<LessonProgressModel?> getAllByLessonIdSync(List<String> lessonIdValues) {
    final values = lessonIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'lessonId', values);
  }

  Future<int> deleteAllByLessonId(List<String> lessonIdValues) {
    final values = lessonIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'lessonId', values);
  }

  int deleteAllByLessonIdSync(List<String> lessonIdValues) {
    final values = lessonIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'lessonId', values);
  }

  Future<Id> putByLessonId(LessonProgressModel object) {
    return putByIndex(r'lessonId', object);
  }

  Id putByLessonIdSync(LessonProgressModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'lessonId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLessonId(List<LessonProgressModel> objects) {
    return putAllByIndex(r'lessonId', objects);
  }

  List<Id> putAllByLessonIdSync(List<LessonProgressModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'lessonId', objects, saveLinks: saveLinks);
  }
}

extension LessonProgressModelQueryWhereSort
    on QueryBuilder<LessonProgressModel, LessonProgressModel, QWhere> {
  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LessonProgressModelQueryWhere
    on QueryBuilder<LessonProgressModel, LessonProgressModel, QWhereClause> {
  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
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

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
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

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
      lessonIdEqualTo(String lessonId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lessonId',
        value: [lessonId],
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterWhereClause>
      lessonIdNotEqualTo(String lessonId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lessonId',
              lower: [],
              upper: [lessonId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lessonId',
              lower: [lessonId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lessonId',
              lower: [lessonId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lessonId',
              lower: [],
              upper: [lessonId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LessonProgressModelQueryFilter on QueryBuilder<LessonProgressModel,
    LessonProgressModel, QFilterCondition> {
  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      completedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      completedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      completedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
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

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
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

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
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

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lessonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lessonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lessonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lessonId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonId',
        value: '',
      ));
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterFilterCondition>
      lessonIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lessonId',
        value: '',
      ));
    });
  }
}

extension LessonProgressModelQueryObject on QueryBuilder<LessonProgressModel,
    LessonProgressModel, QFilterCondition> {}

extension LessonProgressModelQueryLinks on QueryBuilder<LessonProgressModel,
    LessonProgressModel, QFilterCondition> {}

extension LessonProgressModelQuerySortBy
    on QueryBuilder<LessonProgressModel, LessonProgressModel, QSortBy> {
  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      sortByLessonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonId', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      sortByLessonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonId', Sort.desc);
    });
  }
}

extension LessonProgressModelQuerySortThenBy
    on QueryBuilder<LessonProgressModel, LessonProgressModel, QSortThenBy> {
  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByLessonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonId', Sort.asc);
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QAfterSortBy>
      thenByLessonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonId', Sort.desc);
    });
  }
}

extension LessonProgressModelQueryWhereDistinct
    on QueryBuilder<LessonProgressModel, LessonProgressModel, QDistinct> {
  QueryBuilder<LessonProgressModel, LessonProgressModel, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<LessonProgressModel, LessonProgressModel, QDistinct>
      distinctByLessonId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonId', caseSensitive: caseSensitive);
    });
  }
}

extension LessonProgressModelQueryProperty
    on QueryBuilder<LessonProgressModel, LessonProgressModel, QQueryProperty> {
  QueryBuilder<LessonProgressModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LessonProgressModel, DateTime, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<LessonProgressModel, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<LessonProgressModel, String, QQueryOperations>
      lessonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonId');
    });
  }
}
