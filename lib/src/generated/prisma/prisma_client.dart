// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_annotation/json_annotation.dart';
import 'package:orm/binary_engine.dart' as _i5;
import 'package:orm/engine_core.dart' as _i3;
import 'package:orm/graphql.dart' as _i2;
import 'package:orm/logger.dart' as _i4;
import 'package:orm/orm.dart' as _i1;
import 'package:orm/orm.dart' show DateTimeJsonConverter;

part 'prisma_client.g.dart';

enum ArticleScalarFieldEnum implements _i1.PrismaEnum {
  id,
  title,
  cover,
  category,
  createdAt;

  @override
  String? get originalName => null;
}

enum SortOrder implements _i1.PrismaEnum {
  asc,
  desc;

  @override
  String? get originalName => null;
}

@_i1.jsonSerializable
class ArticleWhereInput implements _i1.JsonSerializable {
  const ArticleWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleWhereInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleWhereInputFromJson(json);

  final Iterable<ArticleWhereInput>? AND;

  final Iterable<ArticleWhereInput>? OR;

  final Iterable<ArticleWhereInput>? NOT;

  final IntFilter? id;

  final StringFilter? title;

  final StringFilter? cover;

  final StringFilter? category;

  final StringFilter? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleWhereInputToJson(this);
}

@_i1.jsonSerializable
class ArticleOrderByWithRelationInput implements _i1.JsonSerializable {
  const ArticleOrderByWithRelationInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleOrderByWithRelationInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? cover;

  final SortOrder? category;

  final SortOrder? createdAt;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class ArticleWhereUniqueInput implements _i1.JsonSerializable {
  const ArticleWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleWhereUniqueInputFromJson(json);

  final int? id;

  final Iterable<ArticleWhereInput>? AND;

  final Iterable<ArticleWhereInput>? OR;

  final Iterable<ArticleWhereInput>? NOT;

  final StringFilter? title;

  final StringFilter? cover;

  final StringFilter? category;

  final StringFilter? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class ArticleOrderByWithAggregationInput implements _i1.JsonSerializable {
  const ArticleOrderByWithAggregationInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory ArticleOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$ArticleOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? cover;

  final SortOrder? category;

  final SortOrder? createdAt;

  @JsonKey(name: r'_count')
  final ArticleCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final ArticleAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final ArticleMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final ArticleMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final ArticleSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class ArticleScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const ArticleScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$ArticleScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<ArticleScalarWhereWithAggregatesInput>? AND;

  final Iterable<ArticleScalarWhereWithAggregatesInput>? OR;

  final Iterable<ArticleScalarWhereWithAggregatesInput>? NOT;

  final IntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? title;

  final StringWithAggregatesFilter? cover;

  final StringWithAggregatesFilter? category;

  final StringWithAggregatesFilter? createdAt;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class ArticleCreateInput implements _i1.JsonSerializable {
  const ArticleCreateInput({
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleCreateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleCreateInputFromJson(json);

  final String? title;

  final String? cover;

  final String? category;

  final String? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleCreateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleUncheckedCreateInput implements _i1.JsonSerializable {
  const ArticleUncheckedCreateInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleUncheckedCreateInputFromJson(json);

  final int? id;

  final String? title;

  final String? cover;

  final String? category;

  final String? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleUpdateInput implements _i1.JsonSerializable {
  const ArticleUpdateInput({
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? title;

  final StringFieldUpdateOperationsInput? cover;

  final StringFieldUpdateOperationsInput? category;

  final StringFieldUpdateOperationsInput? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleUpdateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleUncheckedUpdateInput implements _i1.JsonSerializable {
  const ArticleUncheckedUpdateInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleUncheckedUpdateInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? title;

  final StringFieldUpdateOperationsInput? cover;

  final StringFieldUpdateOperationsInput? category;

  final StringFieldUpdateOperationsInput? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleUpdateManyMutationInput implements _i1.JsonSerializable {
  const ArticleUpdateManyMutationInput({
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleUpdateManyMutationInputFromJson(json);

  final StringFieldUpdateOperationsInput? title;

  final StringFieldUpdateOperationsInput? cover;

  final StringFieldUpdateOperationsInput? category;

  final StringFieldUpdateOperationsInput? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class ArticleUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const ArticleUncheckedUpdateManyInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleUncheckedUpdateManyInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleUncheckedUpdateManyInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? title;

  final StringFieldUpdateOperationsInput? cover;

  final StringFieldUpdateOperationsInput? category;

  final StringFieldUpdateOperationsInput? createdAt;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class IntFilter implements _i1.JsonSerializable {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory IntFilter.fromJson(Map<String, dynamic> json) =>
      _$IntFilterFromJson(json);

  final IntFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final IntFieldRefInput? lt;

  final IntFieldRefInput? lte;

  final IntFieldRefInput? gt;

  final IntFieldRefInput? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$IntFilterToJson(this);
}

@_i1.jsonSerializable
class StringFilter implements _i1.JsonSerializable {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  final StringFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final StringFieldRefInput? lt;

  final StringFieldRefInput? lte;

  final StringFieldRefInput? gt;

  final StringFieldRefInput? gte;

  final StringFieldRefInput? contains;

  final StringFieldRefInput? startsWith;

  final StringFieldRefInput? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringFilterToJson(this);
}

@_i1.jsonSerializable
class ArticleCountOrderByAggregateInput implements _i1.JsonSerializable {
  const ArticleCountOrderByAggregateInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$ArticleCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? cover;

  final SortOrder? category;

  final SortOrder? createdAt;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const ArticleAvgOrderByAggregateInput({this.id});

  factory ArticleAvgOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const ArticleMaxOrderByAggregateInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleMaxOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? cover;

  final SortOrder? category;

  final SortOrder? createdAt;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleMinOrderByAggregateInput implements _i1.JsonSerializable {
  const ArticleMinOrderByAggregateInput({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleMinOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? cover;

  final SortOrder? category;

  final SortOrder? createdAt;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class ArticleSumOrderByAggregateInput implements _i1.JsonSerializable {
  const ArticleSumOrderByAggregateInput({this.id});

  factory ArticleSumOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$ArticleSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$ArticleSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class IntWithAggregatesFilter implements _i1.JsonSerializable {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory IntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$IntWithAggregatesFilterFromJson(json);

  final IntFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final IntFieldRefInput? lt;

  final IntFieldRefInput? lte;

  final IntFieldRefInput? gt;

  final IntFieldRefInput? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$IntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringWithAggregatesFilter implements _i1.JsonSerializable {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$StringWithAggregatesFilterFromJson(json);

  final StringFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final StringFieldRefInput? lt;

  final StringFieldRefInput? lte;

  final StringFieldRefInput? gt;

  final StringFieldRefInput? gte;

  final StringFieldRefInput? contains;

  final StringFieldRefInput? startsWith;

  final StringFieldRefInput? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$StringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const StringFieldUpdateOperationsInput({this.set});

  factory StringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$StringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$StringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class IntFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  factory IntFieldUpdateOperationsInput.fromJson(Map<String, dynamic> json) =>
      _$IntFieldUpdateOperationsInputFromJson(json);

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => _$IntFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class NestedIntFilter implements _i1.JsonSerializable {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntFilterFromJson(json);

  final IntFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final IntFieldRefInput? lt;

  final IntFieldRefInput? lte;

  final IntFieldRefInput? gt;

  final IntFieldRefInput? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringFilter implements _i1.JsonSerializable {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringFilterFromJson(json);

  final StringFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final StringFieldRefInput? lt;

  final StringFieldRefInput? lte;

  final StringFieldRefInput? gt;

  final StringFieldRefInput? gte;

  final StringFieldRefInput? contains;

  final StringFieldRefInput? startsWith;

  final StringFieldRefInput? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NestedIntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntWithAggregatesFilterFromJson(json);

  final IntFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final IntFieldRefInput? lt;

  final IntFieldRefInput? lte;

  final IntFieldRefInput? gt;

  final IntFieldRefInput? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$NestedIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedFloatFilter implements _i1.JsonSerializable {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedFloatFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedFloatFilterFromJson(json);

  final FloatFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final FloatFieldRefInput? lt;

  final FloatFieldRefInput? lte;

  final FloatFieldRefInput? gt;

  final FloatFieldRefInput? gte;

  final NestedFloatFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedFloatFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringWithAggregatesFilterFromJson(json);

  final StringFieldRefInput? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final StringFieldRefInput? lt;

  final StringFieldRefInput? lte;

  final StringFieldRefInput? gt;

  final StringFieldRefInput? gte;

  final StringFieldRefInput? contains;

  final StringFieldRefInput? startsWith;

  final StringFieldRefInput? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class Article implements _i1.JsonSerializable {
  const Article({
    required this.id,
    required this.title,
    required this.cover,
    required this.category,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  final int id;

  final String title;

  final String cover;

  final String category;

  final String createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

class ArticleFluent<T> extends _i1.PrismaFluent<T> {
  const ArticleFluent(
    super.original,
    super.$query,
  );
}

extension ArticleModelDelegateExtension on _i1.ModelDelegate<Article> {
  ArticleFluent<Article?> findUnique({required ArticleWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueArticle',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : null);
    return ArticleFluent<Article?>(
      future,
      query,
    );
  }

  ArticleFluent<Article> findUniqueOrThrow(
      {required ArticleWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueArticleOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueArticleOrThrow',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Article)'));
    return ArticleFluent<Article>(
      future,
      query,
    );
  }

  ArticleFluent<Article?> findFirst({
    ArticleWhereInput? where,
    Iterable<ArticleOrderByWithRelationInput>? orderBy,
    ArticleWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<ArticleScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstArticle',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : null);
    return ArticleFluent<Article?>(
      future,
      query,
    );
  }

  ArticleFluent<Article> findFirstOrThrow({
    ArticleWhereInput? where,
    Iterable<ArticleOrderByWithRelationInput>? orderBy,
    ArticleWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<ArticleScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstArticleOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstArticleOrThrow',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Article)'));
    return ArticleFluent<Article>(
      future,
      query,
    );
  }

  Future<Iterable<Article>> findMany({
    ArticleWhereInput? where,
    Iterable<ArticleOrderByWithRelationInput>? orderBy,
    ArticleWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<ArticleScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyArticle',
    );
    final fields = ArticleScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyArticle) => findManyArticle
        .map((Map findManyArticle) => Article.fromJson(findManyArticle.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  ArticleFluent<Article> create({ArticleCreateInput? data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneArticle',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Article)'));
    return ArticleFluent<Article>(
      future,
      query,
    );
  }

  ArticleFluent<Article?> update({
    required ArticleUpdateInput data,
    required ArticleWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneArticle',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : null);
    return ArticleFluent<Article?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required ArticleUpdateManyMutationInput data,
    ArticleWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyArticle',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyArticle) =>
        AffectedRowsOutput.fromJson(updateManyArticle.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  ArticleFluent<Article> upsert({
    required ArticleWhereUniqueInput where,
    required ArticleCreateInput create,
    required ArticleUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneArticle',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Article)'));
    return ArticleFluent<Article>(
      future,
      query,
    );
  }

  ArticleFluent<Article?> delete({required ArticleWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneArticle',
    );
    final future = query(ArticleScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Article.fromJson(json.cast<String, dynamic>())
            : null);
    return ArticleFluent<Article?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({ArticleWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyArticle',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyArticle) =>
        AffectedRowsOutput.fromJson(deleteManyArticle.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateArticle aggregate({
    ArticleWhereInput? where,
    Iterable<ArticleOrderByWithRelationInput>? orderBy,
    ArticleWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateArticle',
    );
    return AggregateArticle(query);
  }

  Future<Iterable<ArticleGroupByOutputType>> groupBy({
    ArticleWhereInput? where,
    Iterable<ArticleOrderByWithAggregationInput>? orderBy,
    required Iterable<ArticleScalarFieldEnum> by,
    ArticleScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByArticle',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByArticle',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByArticle) =>
        groupByArticle.map((Map groupByArticle) =>
            ArticleGroupByOutputType.fromJson(groupByArticle.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

@_i1.jsonSerializable
class ArticleGroupByOutputType implements _i1.JsonSerializable {
  const ArticleGroupByOutputType({
    this.id,
    this.title,
    this.cover,
    this.category,
    this.createdAt,
  });

  factory ArticleGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$ArticleGroupByOutputTypeFromJson(json);

  final int? id;

  final String? title;

  final String? cover;

  final String? category;

  final String? createdAt;

  @override
  Map<String, dynamic> toJson() => _$ArticleGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class AffectedRowsOutput implements _i1.JsonSerializable {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map<String, dynamic> json) =>
      _$AffectedRowsOutputFromJson(json);

  final int? count;

  @override
  Map<String, dynamic> toJson() => _$AffectedRowsOutputToJson(this);
}

class AggregateArticle {
  const AggregateArticle(this.$query);

  final _i1.PrismaFluentQuery $query;

  ArticleCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return ArticleCountAggregateOutputType(query);
  }

  ArticleAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return ArticleAvgAggregateOutputType(query);
  }

  ArticleSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return ArticleSumAggregateOutputType(query);
  }

  ArticleMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return ArticleMinAggregateOutputType(query);
  }

  ArticleMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return ArticleMaxAggregateOutputType(query);
  }
}

class ArticleCountAggregateOutputType {
  const ArticleCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> title() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'title',
          fields: fields,
        )
      ]),
      key: r'title',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> cover() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cover',
          fields: fields,
        )
      ]),
      key: r'cover',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> category() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'category',
          fields: fields,
        )
      ]),
      key: r'category',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> createdAt() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'createdAt',
          fields: fields,
        )
      ]),
      key: r'createdAt',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class ArticleAvgAggregateOutputType {
  const ArticleAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class ArticleSumAggregateOutputType {
  const ArticleSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class ArticleMinAggregateOutputType {
  const ArticleMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> title() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'title',
          fields: fields,
        )
      ]),
      key: r'title',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> cover() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cover',
          fields: fields,
        )
      ]),
      key: r'cover',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> category() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'category',
          fields: fields,
        )
      ]),
      key: r'category',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> createdAt() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'createdAt',
          fields: fields,
        )
      ]),
      key: r'createdAt',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class ArticleMaxAggregateOutputType {
  const ArticleMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> title() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'title',
          fields: fields,
        )
      ]),
      key: r'title',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> cover() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cover',
          fields: fields,
        )
      ]),
      key: r'cover',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> category() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'category',
          fields: fields,
        )
      ]),
      key: r'category',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> createdAt() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'createdAt',
          fields: fields,
        )
      ]),
      key: r'createdAt',
    );
    return query(const []).then((value) => (value as String?));
  }
}

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class Datasources implements _i1.JsonSerializable {
  const Datasources({this.db});

  final String? db;

  @override
  Map<String, dynamic> toJson() => _$DatasourcesToJson(this);
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient._internal(
    _i3.Engine engine, {
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  })  : _engine = engine,
        _headers = headers,
        _transaction = transaction,
        super(
          engine,
          headers: headers,
          transaction: transaction,
        );

  factory PrismaClient({
    Datasources? datasources,
    Iterable<_i4.Event>? stdout,
    Iterable<_i4.Event>? event,
  }) {
    final logger = _i4.Logger(
      stdout: stdout,
      event: event,
    );
    final engine = _i5.BinaryEngine(
      logger: logger,
      schema:
          r'Ly8gVGhpcyBpcyB5b3VyIFByaXNtYSBzY2hlbWEgZmlsZSwKLy8gbGVhcm4gbW9yZSBhYm91dCBpdCBpbiB0aGUgZG9jczogaHR0cHM6Ly9wcmlzLmx5L2QvcHJpc21hLXNjaGVtYQoKZ2VuZXJhdG9yIGNsaWVudCB7CiAgcHJvdmlkZXIgPSAiZGFydCBydW4gb3JtIgp9CgpkYXRhc291cmNlIGRiIHsKICBwcm92aWRlciA9ICJzcWxpdGUiCiAgLy8gdXJsICAgICAgPSAiZmlsZTouL2RiLnNxbGl0ZSIKICB1cmwgICAgICA9IGVudigiREFUQUJBU0VfVVJMIikKfQptb2RlbCBBcnRpY2xlIHsKICAgaWQgSW50IEBpZCBAZGVmYXVsdChhdXRvaW5jcmVtZW50KCkpCiAgIHRpdGxlIFN0cmluZyBAZGVmYXVsdCgiIikKICAgY292ZXIgU3RyaW5nIEBkZWZhdWx0KCIiKQogICBjYXRlZ29yeSBTdHJpbmcgQGRlZmF1bHQoIiIpCiAgIGNyZWF0ZWRBdCBTdHJpbmcgQGRlZmF1bHQoIiIpCn0KCiAgLy8gIGVtYWlsIFN0cmluZyBAdW5pcXVl',
      datasources: datasources?.toJson().cast() ?? const {},
      executable:
          r'/Users/GE019120108/node_modules/prisma/query-engine-darwin-arm64',
    );
    return PrismaClient._internal(engine);
  }

  final _i3.Engine _engine;

  final _i3.QueryEngineRequestHeaders? _headers;

  final _i3.TransactionInfo? _transaction;

  @override
  PrismaClient copyWith({
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  }) =>
      PrismaClient._internal(
        _engine,
        headers: headers ?? _headers,
        transaction: transaction ?? _transaction,
      );
  _i1.ModelDelegate<Article> get article => _i1.ModelDelegate<Article>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
}
