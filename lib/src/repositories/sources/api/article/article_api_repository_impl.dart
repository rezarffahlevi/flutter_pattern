import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ArticleApiRepositoryImpl implements ArticleApiRepository {
  final Dio? dio;
  final Dio? mocky;

  ArticleApiRepositoryImpl({this.dio, this.mocky});

  @override
  Future<ArticleListResponseModel> getListArticle({
    String? keyword,
    int? page,
    String? categoryId,
    bool? bookmark,
    String? arraySubCategoryId,
  }) async {
    try {
      final res = await mocky!.post('/v3/b456bc2b-a325-4c2f-b172-262d97ec7a10',
      // final res = await dio!.post('article/article-list-v2',
          data: jsonEncode({
            'keyword': keyword,
            'page': page,
            'category_id': categoryId,
            'sub_category_id': arraySubCategoryId,
            'bookmark': bookmark,
          }));
      return ArticleListResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
