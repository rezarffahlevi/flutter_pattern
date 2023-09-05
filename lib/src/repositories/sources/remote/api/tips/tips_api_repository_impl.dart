import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/models/tips/tips_detail_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/tips/tips_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class TipsApiRepositoryImpl implements TipsApiRepository {
  final Dio? dio;
  final Dio? mocky;

  TipsApiRepositoryImpl({this.dio, this.mocky});

  Future<TipsCategoryResponseModel> getCategory() async {
    try {
      final response = await dio!.get('tips/tips-category');
      return TipsCategoryResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }

  @override
  Future<TipsListResponseModel> getTipsList({
    String? subCategoryId,
    String? keyword,
    bool? bookmark,
    int? page,
  }) async {
    try {
      final res = await dio!.post('tips/tips-list', data: {
        'page': page,
        'bookmark': bookmark,
        'sub_category_id': subCategoryId,
        if (keyword != null) 'keyword': keyword,
      });
      return TipsListResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }

  @override
  Future<TipsBookmarkResponseModel> getTipsBookmark({
    String? status,
    String? tipsId,
  }) async {
    try {
      final res = await dio!.post('tips/tips-bookmark', data: {
        'status': status,
        'tips_id': tipsId,
      });
      return TipsBookmarkResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }

  @override
  Future<TipsDetailResponseModel> getTipsDetail({String? tipsId}) async {
    try {
      final res = await dio!.post('tips/tips-detail', data: {
        'tips_id': tipsId,
      });
      return TipsDetailResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }
}
