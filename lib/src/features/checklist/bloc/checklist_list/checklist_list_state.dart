import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/week_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ChecklistListState extends Equatable {
  final double scrollPosition;
  final String? displayName;
  final ViewData<List<FetusModel>> listFetus;
  final ViewData<List<WeekModel>> listWeek;
  final ViewData<ChecklistListResponseModel> listChecklist;
  final ViewData<List<Map<String, dynamic>>> menu;
  final int selectedFetus;
  final int selectedWeek;
  final int page;
  final int currentCheckedList;
  final int totalChecklist;
  final double? percentage;

  ChecklistListState({
    this.scrollPosition = 0,
    this.displayName = '',
    this.listFetus = const ViewData(),
    this.listWeek = const ViewData(),
    this.listChecklist = const ViewData(),
    this.menu = const ViewData(),
    this.selectedFetus = 0,
    this.selectedWeek = 0,
    this.page = 1,
    this.currentCheckedList = 0,
    this.totalChecklist = 0,
    this.percentage,
  });

  ChecklistListState copyWith({
    double? scrollPosition,
    String? displayName,
    ViewData<List<FetusModel>>? listFetus,
    ViewData<List<WeekModel>>? listWeek,
    ViewData<ChecklistListResponseModel>? listChecklist,
    ViewData<List<Map<String, dynamic>>>? menu,
    int? selectedFetus,
    int? selectedWeek,
    int? currentCheckedList,
    int? totalChecklist,
    double? percentage,
    int? page,
  }) {
    return ChecklistListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      displayName: displayName ?? this.displayName,
      listFetus: listFetus ?? this.listFetus,
      listWeek: listWeek ?? this.listWeek,
      listChecklist: listChecklist ?? this.listChecklist,
      menu: menu ?? this.menu,
      selectedFetus: selectedFetus ?? this.selectedFetus,
      selectedWeek: selectedWeek ?? this.selectedWeek,
      currentCheckedList: currentCheckedList ?? this.currentCheckedList,
      totalChecklist: totalChecklist ?? this.totalChecklist,
      percentage: percentage ?? this.percentage,
      page: page ?? this.page,
    );
  }

  @override
  List get props => [
        scrollPosition,
        displayName,
        listFetus,
        listWeek,
        listChecklist,
        menu,
        selectedFetus,
        selectedWeek,
        currentCheckedList,
        totalChecklist,
        percentage,
        page
      ];
}
