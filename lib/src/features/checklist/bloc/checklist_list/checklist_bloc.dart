import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../configs/configs.dart';
import '../../../../helpers/helpers.dart';
import '../../../../repositories/models/article/article_model.dart';
import '../../../../repositories/repositories.dart';
import '../../../features.dart';
import 'checklist_state.dart';

class ChecklistListBloc extends Cubit<ChecklistListState> {
  ChecklistListBloc() : super(ChecklistListState());

  final repo = inject<AuthApiRepository>();
  final checklistRepo = inject<ChecklistApiRepository>();

  final ScrollController scrollController = ScrollController();

  init(BuildContext context, String id) async {
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
      await eventGetChecklistList();
      eventGetFetus();
    } catch (e, s) {}
  }

  eventGetChecklistList({int? fetusId}) async {
    try {
      emit(state.copyWith(listChecklist: ViewData.loading()));
      final response = await checklistRepo.getChecklistList(fetusId: fetusId);

      final list = response.data ?? [];
      emit(state.copyWith(
        listChecklist: ViewData.loaded(response),
      ));
    } catch (e, s) {
      emit(state.copyWith(listChecklist: ViewData.error(e.toString())));
    }
  }

  eventGetFetus() async {
    try {
      emit(state.copyWith(listChecklist: ViewData.loading()));
      final response = await checklistRepo.getListFetus();

      final list = response.data ?? [];
      emit(state.copyWith(
        listFetus: ViewData.loaded(response),
      ));
    } catch (e, s) {
      emit(state.copyWith(listChecklist: ViewData.error(e.toString())));
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
    eventGetFetus();
  }

  eventOnTapArticle(BuildContext context, ArticleModel item) {
    context.go('${ArticleDetailScreen.routeName}?id=${item.articleId}',
        extra: item);
  }
}
