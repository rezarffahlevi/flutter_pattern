import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/article/ui/article_detail_screen.dart';
import '../../../../repositories/models/article/article_model.dart';
import '../../../../repositories/models/models.dart';
import 'package:temanbumil_web/src/features/home/ui/home_screen.dart';

import '../../../../configs/configs.dart';
import '../../../../helpers/helpers.dart';
import '../../../../repositories/sources/remote/api/api.dart';
import '../bloc.dart';

class HomeAppBloc extends Cubit<HomeAppState> {
  HomeAppBloc() : super(HomeAppState());

  final repo = inject<AuthApiRepository>();
  final articleRepo = inject<ArticleApiRepository>();
  final tipsRepo = inject<TipsApiRepository>();

  final ScrollController scrollController = ScrollController();

  init(BuildContext context) async {
    emit(state.copyWith(
        menu: ViewData.loaded([
      {'menu': 'Home', 'link': 'home', 'hover': false},
      {'menu': 'Artikel', 'link': '/article', 'hover': false},
      {'menu': 'Checklist', 'link': '', 'hover': false},
      {'menu': 'Tips', 'link': '', 'hover': false},
      {'menu': 'Login', 'link': 'login', 'hover': false},
    ])));

    scrollController.addListener(scrollListener);
    eventOnLoading();
  }

  scrollListener() {
    emit(state.copyWith(scrollPosition: scrollController.position.pixels));
  }

  eventOnLoading() async {
    try {
      eventGetArticle();
      eventGetTips();
    } catch (e, s) {}
  }

  eventGetArticle() async {
    try {
      emit(state.copyWith(listArticle: ViewData.loading()));
      final response = await articleRepo.getListArticle(
        page: 1,
        categoryId: '1',
        arraySubCategoryId: '1',
        bookmark: false,
      );

      final list = response.data?.article ?? [];
      emit(state.copyWith(
        listArticle: ViewData.loaded(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listArticle: ViewData.error(e.toString())));
    }
  }

  eventGetTips() async {
    try {
      emit(state.copyWith(listTips: ViewData.loading()));
      final response = await tipsRepo.getTipsList(
          page: 1, bookmark: false, subCategoryId: '1');

      final list = response.data?.tips ?? [];
      emit(state.copyWith(
        listTips: ViewData.loaded(list),
      ));
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
    emit(state.copyWith(selectedCategory: category));
  }

  eventOnTapArticle(BuildContext context, ArticleModel item) {
    context.go('${ArticleDetailScreen.routeName}?id=${item.articleId}',
        extra: item);
  }
}
