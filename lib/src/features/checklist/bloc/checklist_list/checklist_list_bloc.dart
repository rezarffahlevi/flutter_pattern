import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/checklist/bloc/checklist_list/checklist_list_state.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/maternity_week_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/newborn_week_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/week_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ChecklistListBloc extends Cubit<ChecklistListState> {
  ChecklistListBloc() : super(ChecklistListState());

  final repo = inject<AuthApiRepository>();
  final checklistRepo = inject<ChecklistApiRepository>();

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
      await eventGetFetus();
      await eventGetWeeks();
      eventGetChecklist();
    } catch (e, s) {}
  }

  Future<List<WeekModel>?> eventGetWeeks() async {
    try {
      if (state.listFetus.data?[state.selectedFetus].status == 'maternity') {
        String weeks = await rootBundle.loadString('json/json_maternity_weeks.json');
        final jsonDecoded = json.decode(weeks);
        MaternityWeekModel weeksModel = MaternityWeekModel.fromJson(jsonDecoded);
        emit(state.copyWith(listWeek: ViewData.loaded(weeksModel.data)));
        return weeksModel.data;
      } else if (state.listFetus.data?[state.selectedFetus].status?.contains('born') ?? false) {
        String weeks = await rootBundle.loadString('json/json_newborn_weeks.json');
        final jsonDecoded = json.decode(weeks);
        NewbornWeekModel weeksModel = NewbornWeekModel.fromJson(jsonDecoded);
        emit(state.copyWith(listWeek: ViewData.loaded(weeksModel.data)));
        return weeksModel.data;
      } else {
        return null;
      }
    } catch (e, s) {
      emit(state.copyWith(listWeek: ViewData.error(e.toString())));
    }
  }

  eventGetFetus() async {
    try {
      emit(state.copyWith(listFetus: ViewData.loading()));
      final response = await checklistRepo.getListFetus();

      final list = response.data ?? [];
      emit(state.copyWith(
        listFetus: ViewData.loaded(list),
      ));
    } catch (e, s) {
      emit(state.copyWith(listFetus: ViewData.error(e.toString())));
    }
  }

  eventGetChecklist({int? page}) async {
    try {
      if ((page ?? 1) < 2) emit(state.copyWith(listChecklist: ViewData.loading()));

      FetusModel? fetus = state.listFetus.data?[state.selectedFetus];
      final response = await checklistRepo.getChecklistList(
          fetusId: fetus?.fetusId,
          week: state.listWeek.data?[state.selectedWeek].week,
          weekUnit: state.listWeek.data?[state.selectedWeek].weekUnit,
          milestone: false);

      emit(state.copyWith(
        listChecklist: ViewData.loaded(response),
        page: page,
        displayName: await Prefs.memberId,
        currentCheckedList: response.data?.countChecked ?? 0,
        totalChecklist: response.data?.countChecklist ?? 0,
        percentage: response.data?.percentage ?? 0,
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

  eventOnChangeFetus(category) async {
    emit(state.copyWith(selectedFetus: category, selectedWeek: 0, page: 1));
    await eventGetWeeks();
    eventGetChecklist();
  }

  eventOnChangeWeek(subCategory) async {
    emit(state.copyWith(selectedWeek: subCategory, page: 1));
    await eventGetWeeks();
    eventGetChecklist();
  }

  eventChecklistClicked({ChecklistNode? checklistNode}) async {
    final response = await checklistRepo.checklistCheck(
        fetusId: state.listFetus.data?[state.selectedFetus].fetusId,
        checkId: checklistNode!.checkId,
        checklistId: checklistNode.checklistId);

    if (response.data!.insertId != 0)
      emit(state.copyWith(
        currentCheckedList: state.currentCheckedList + 1,
      ));
    else
      emit(state.copyWith(
        currentCheckedList: state.currentCheckedList - 1,
      ));

    emit(state.copyWith(
      percentage: (state.currentCheckedList / state.totalChecklist) * 100,
    ));
  }
}
