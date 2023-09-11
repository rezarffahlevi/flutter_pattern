import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/models.dart';
import 'package:temanbumil_web/src/repositories/sources/remote/api/api.dart';

import '../../../../configs/configs.dart';
import '../../../../repositories/models/article/article_model.dart';
import '../../../article/ui/ui.dart';
import '../../../home/ui/ui.dart';
import '../bloc.dart';

class TipsListBloc extends Cubit<TipsListState> {
  TipsListBloc() : super(TipsListState());

  final repo = inject<AuthApiRepository>();
  final articleRepo = inject<ArticleApiRepository>();
  final tipsRepo = inject<TipsApiRepository>();

  final ScrollController scrollController = ScrollController();

  init(BuildContext context) async {
    emit(state.copyWith(
        menu: ViewData.loaded([
      {'menu': 'Home', 'link': '/home-app', 'hover': false},
      {'menu': 'Artikel', 'link': '/article', 'hover': false},
      {'menu': 'Checklist', 'link': '/checklist', 'hover': false},
      {'menu': 'Tips', 'link': '/tips', 'hover': false},
      {'menu': 'Logout', 'link': 'logout', 'hover': false},
    ])));
    scrollController.addListener(scrollListener);
    eventOnLoading();
    // await Helper.addDelay(1);
    // context.pop();
  }

  scrollListener() {
    emit(state.copyWith(scrollPosition: scrollController.position.pixels));
  }

  eventOnLoading() async {
    try {
      await eventGetCategory();
      eventGetTips();
    } catch (e, s) {}
  }

  eventGetCategory() async {
    try {
      emit(state.copyWith(listCategory: ViewData.loading()));
      final response = await tipsRepo.getCategory();

      final list = response.data ?? [];
      emit(state.copyWith(
        listCategory: ViewData.loaded(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listCategory: ViewData.error(e.toString())));
    }
  }

  eventGetTips({int? page}) async {
    try {
      if ((page ?? 1) < 2) emit(state.copyWith(listTips: ViewData.loading()));

      List<TipsSubCategoryModel>? subCategory =
          state.listCategory.data?[state.selectedCategory].subCategory;

      String? subCategoryId =
          subCategory?[state.selectedSubCategory]?.subCategoryId?.toString() ??
              '1';

      final response = await tipsRepo.getTipsList(
          page: page ?? state.page,
          bookmark: false,
          subCategoryId: subCategoryId);

      List<TipsModel> list = List.of(state.listTips.data ?? []);
      list.addAll(response.data?.tips ?? []);
      emit(state.copyWith(listTips: ViewData.loaded(list), page: page));
    } catch (e, s) {
      emit(state.copyWith(listTips: ViewData.error(e.toString())));
    }
  }

  eventUpdateMenu(int index, String key, dynamic value) {
    List<Map<String, dynamic>> menu = List.from(state.menu.data ?? []);
    emit(state.copyWith(menu: ViewData.loading()));
    menu[index][key] = value;
    emit(state.copyWith(menu: ViewData.loaded(menu)));
  }

  eventOnTapMenu(BuildContext context, int index, dynamic menu) async {
    switch (menu['link']) {
      case 'home':
        context.go(HomeScreen.routeName);
        break;
      case 'logout':
        AuthHelper.logout(context);
        break;
      default:
        context.go(menu['link']);
        break;
    }
  }

  eventOnChangeCategory(category) {
    emit(state.copyWith(
        selectedCategory: category, selectedSubCategory: 0, page: 1));
    eventGetTips();
  }

  eventOnChangeSubCategory(subCategory) {
    emit(state.copyWith(selectedSubCategory: subCategory, page: 1));
    eventGetTips();
  }

  eventOnTapArticle(BuildContext context, ArticleModel item) {
    context.go('${ArticleDetailScreen.routeName}?id=${item.articleId}',
        extra: item);
  }
}
