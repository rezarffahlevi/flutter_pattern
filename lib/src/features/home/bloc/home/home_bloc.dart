import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/sources/api/api.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState());

  final repo = inject<AuthApiRepository>();
  final articleRepo = inject<ArticleApiRepository>();

  final ScrollController scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 0;

  init(BuildContext context) async {
    scrollController.addListener(scrollListener);
    eventOnLoading();
  }

  scrollListener() {
    emit(state.copyWith(scrollPosition: scrollController.position.pixels));
  }

  eventOnLoading() async {
    try {
      emit(state.copyWith(listData: ResponseData.loading()));
      final response = await articleRepo.getListArticle(
        page: 1,
        categoryId: '1',
        arraySubCategoryId: '1',
        bookmark: false,
      );

      final list = response.data?.article ?? [];
      emit(state.copyWith(
        listData: ResponseData.completed(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listData: ResponseData.error(e.toString())));
    }
  }
}
