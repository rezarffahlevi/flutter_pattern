import 'dart:math';

import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/models/tips/tips_detail_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/tips/tips_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

abstract class TipsApiRepository {
  final Dio? dio;

  TipsApiRepository({required this.dio});

  Future<TipsCategoryResponseModel> getCategory();

  Future<TipsListResponseModel> getTipsList({
    String? subCategoryId,
    String? keyword,
    bool? bookmark,
    int? page,
  });

  Future<TipsDetailResponseModel> getTipsDetail({
    String tipsId,
  });

  Future<TipsBookmarkResponseModel> getTipsBookmark({
    String status,
    String tipsId,
  });
}
