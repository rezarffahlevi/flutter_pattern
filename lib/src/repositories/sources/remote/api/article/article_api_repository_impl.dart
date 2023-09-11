import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_bookmark_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_category_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/article/detail_article_response.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ArticleApiRepositoryImpl implements ArticleApiRepository {
  final Dio? dio;
  final Dio? mocky;

  ArticleApiRepositoryImpl({this.dio, this.mocky});

  @override
  Future<ArticleCategoryResponseModel> getArticleCategory() async {
    try {
      final res = await dio!.get('article/article-category-v2');
      return ArticleCategoryResponseModel.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

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
      throw Exception(e.error);
    }
  }

  @override
  Future<DetailArticleResponseModel> getDetailArticle({
    String? categoryId,
    String? articleId,
    String? subCategoryId,
  }) async {
    try {
      final res = await dio!.post('article/article-detail',
          // final res = await dio!.post('article/articlistle-list-v2',
          data: jsonEncode({
            'category_id': categoryId,
            'sub_category_id': subCategoryId,
            'article_id': articleId,
          }));
      return DetailArticleResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }

  @override
  Future<ArticleBookmarkResponseModel> articleBookmark({
    String? status,
    String? articleId,
  }) async {
    try {
      final res = await dio!.post('article/article-bookmark',
          // final res = await dio!.post('article/article-list-v2',
          data: jsonEncode({
            'status': status,
            'article_id': articleId,
          }));
      return ArticleBookmarkResponseModel.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
