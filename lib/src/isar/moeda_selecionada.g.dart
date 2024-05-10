// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moeda_selecionada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoedaSelecionadaCollection on Isar {
  IsarCollection<MoedaSelecionada> get moedaSelecionadas => this.collection();
}

const MoedaSelecionadaSchema = CollectionSchema(
  name: r'MoedaSelecionada',
  id: 1748846933290125036,
  properties: {
    r'siglass': PropertySchema(
      id: 0,
      name: r'siglass',
      type: IsarType.string,
    )
  },
  estimateSize: _moedaSelecionadaEstimateSize,
  serialize: _moedaSelecionadaSerialize,
  deserialize: _moedaSelecionadaDeserialize,
  deserializeProp: _moedaSelecionadaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moedaSelecionadaGetId,
  getLinks: _moedaSelecionadaGetLinks,
  attach: _moedaSelecionadaAttach,
  version: '3.1.0+1',
);

int _moedaSelecionadaEstimateSize(
  MoedaSelecionada object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.siglass.length * 3;
  return bytesCount;
}

void _moedaSelecionadaSerialize(
  MoedaSelecionada object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.siglass);
}

MoedaSelecionada _moedaSelecionadaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoedaSelecionada();
  object.id = id;
  object.siglass = reader.readString(offsets[0]);
  return object;
}

P _moedaSelecionadaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moedaSelecionadaGetId(MoedaSelecionada object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moedaSelecionadaGetLinks(MoedaSelecionada object) {
  return [];
}

void _moedaSelecionadaAttach(
    IsarCollection<dynamic> col, Id id, MoedaSelecionada object) {
  object.id = id;
}

extension MoedaSelecionadaQueryWhereSort
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QWhere> {
  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoedaSelecionadaQueryWhere
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QWhereClause> {
  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterWhereClause>
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

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterWhereClause> idBetween(
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

extension MoedaSelecionadaQueryFilter
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QFilterCondition> {
  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
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

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
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

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
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

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siglass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siglass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siglass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siglass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siglass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siglass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siglass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siglass',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siglass',
        value: '',
      ));
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterFilterCondition>
      siglassIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siglass',
        value: '',
      ));
    });
  }
}

extension MoedaSelecionadaQueryObject
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QFilterCondition> {}

extension MoedaSelecionadaQueryLinks
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QFilterCondition> {}

extension MoedaSelecionadaQuerySortBy
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QSortBy> {
  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterSortBy>
      sortBySiglass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siglass', Sort.asc);
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterSortBy>
      sortBySiglassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siglass', Sort.desc);
    });
  }
}

extension MoedaSelecionadaQuerySortThenBy
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QSortThenBy> {
  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterSortBy>
      thenBySiglass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siglass', Sort.asc);
    });
  }

  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QAfterSortBy>
      thenBySiglassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siglass', Sort.desc);
    });
  }
}

extension MoedaSelecionadaQueryWhereDistinct
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QDistinct> {
  QueryBuilder<MoedaSelecionada, MoedaSelecionada, QDistinct> distinctBySiglass(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siglass', caseSensitive: caseSensitive);
    });
  }
}

extension MoedaSelecionadaQueryProperty
    on QueryBuilder<MoedaSelecionada, MoedaSelecionada, QQueryProperty> {
  QueryBuilder<MoedaSelecionada, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoedaSelecionada, String, QQueryOperations> siglassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siglass');
    });
  }
}
