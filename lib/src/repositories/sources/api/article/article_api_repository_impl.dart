import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ArticleApiRepositoryImpl implements ArticleApiRepository {
  final Dio? dio;

  ArticleApiRepositoryImpl({required this.dio});

  @override
  Future<ArticleListResponseModel> getListArticle({
    String? keyword,
    int? page,
    String? categoryId,
    bool? bookmark,
    String? arraySubCategoryId,
  }) async {
    try {
      final res = await dio!.post('article/article-list-v2',
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
