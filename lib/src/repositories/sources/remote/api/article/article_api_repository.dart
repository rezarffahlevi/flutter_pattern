import 'dart:math';

import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_bookmark_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_category_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/article/detail_article_response_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

abstract class ArticleApiRepository {
  final Dio? dio;

  ArticleApiRepository({required this.dio});

  Future<ArticleCategoryResponseModel> getArticleCategory();

  Future<ArticleListResponseModel> getListArticle({
    String? keyword,
    int? page,
    String? categoryId,
    bool? bookmark,
    String? arraySubCategoryId,
  });

  Future<DetailArticleResponseModel> getDetailArticle({
    String? categoryId,
    String? articleId,
    String? subCategoryId,
  });

  Future<ArticleBookmarkResponseModel> articleBookmark({
    String? status,
    String? articleId,
  });
}
