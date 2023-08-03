import 'dart:math';

import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

abstract class ArticleApiRepository {
  final Dio? dio;

  ArticleApiRepository({required this.dio});

  Future<ArticleListResponseModel> getListArticle({
    String? keyword,
    int? page,
    String? categoryId,
    bool? bookmark,
    String? arraySubCategoryId,
  });
}
