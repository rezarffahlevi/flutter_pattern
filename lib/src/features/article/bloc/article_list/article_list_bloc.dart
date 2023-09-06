import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';
import 'package:temanbumil_web/src/repositories/sources/remote/api/api.dart';

class ArticleListBloc extends Cubit<ArticleListState> {
  ArticleListBloc() : super(ArticleListState());

  final repo = inject<AuthApiRepository>();
  final articleRepo = inject<ArticleApiRepository>();

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
      eventGetArticle();
    } catch (e, s) {}
  }

  eventGetArticle({int? page}) async {
    try {
      if ((page ?? 1) < 2)
        emit(state.copyWith(listArticle: ViewData.loading()));

      String? categoryId = state
              .listCategory.data?[state.selectedCategory].categoryId
              ?.toString() ??
          '1';
      String? subCategoryId = state.listCategory.data?[state.selectedCategory]
              .subCategory?[state.selectedSubCategory].subCategoryId
              ?.toString() ??
          '1';
      final response = await articleRepo.getListArticle(
        page: page ?? state.page,
        categoryId: categoryId,
        arraySubCategoryId: subCategoryId + ', $categoryId',
        bookmark: false,
      );

      List<ArticleModel> list = List.of(state.listArticle.data ?? []);
      list.addAll(response.data?.article ?? []);
      emit(state.copyWith(listArticle: ViewData.loaded(list), page: page));
    } catch (e, s) {
      emit(state.copyWith(listArticle: ViewData.error(e.toString())));
    }
  }

  eventGetCategory() async {
    try {
      emit(state.copyWith(listCategory: ViewData.loading()));
      final response = await articleRepo.getArticleCategory();

      final list = response.data ?? [];
      emit(state.copyWith(
        listCategory: ViewData.loaded(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listCategory: ViewData.error(e.toString())));
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
    emit(state.copyWith(selectedCategory: category, selectedSubCategory: 0, page: 1));
    eventGetArticle();
  }

  eventOnChangeSubCategory(subCategory) {
    emit(state.copyWith(selectedSubCategory: subCategory, page: 1));
    eventGetArticle();
  }

  eventOnTapArticle(BuildContext context, ArticleModel item) {
    context.go('${ArticleDetailScreen.routeName}?id=${item.articleId}',
        extra: item);
  }
}
