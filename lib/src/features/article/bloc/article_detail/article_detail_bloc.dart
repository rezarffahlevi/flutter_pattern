import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';
import 'package:temanbumil_web/src/repositories/sources/remote/api/api.dart';

class ArticleDetailBloc extends Cubit<ArticleDetailState> {
  ArticleDetailBloc() : super(ArticleDetailState());

  final repo = inject<AuthApiRepository>();
  final articleRepo = inject<ArticleApiRepository>();
  final tipsRepo = inject<TipsApiRepository>();

  final ScrollController scrollController = ScrollController();

  init(String? id) async {
    emit(state.copyWith(
        menu: ViewData.loaded([
      {'menu': 'Home', 'link': 'home', 'hover': false},
      {'menu': 'Artikel', 'link': '', 'hover': false},
      {'menu': 'Checklist', 'link': '', 'hover': false},
      {'menu': 'Tips', 'link': '', 'hover': false},
      {'menu': 'Logout', 'link': 'logout', 'hover': false},
    ])));
    scrollController.addListener(scrollListener);
    eventOnLoading(id);
  }

  scrollListener() {
    emit(state.copyWith(scrollPosition: scrollController.position.pixels));
  }

  eventOnLoading(String? id) async {
    try {
      emit(state.copyWith(detail: ViewData.loading()));
      final response = await articleRepo.getDetailArticle(articleId: id);

      emit(state.copyWith(
        detail: ViewData.loaded(response),
      ));
    } catch (e, s) {
      emit(state.copyWith(detail: ViewData.error(e.toString())));
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
    }
  }
}
