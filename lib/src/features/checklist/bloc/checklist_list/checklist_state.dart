import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/list_fetus_response_model.dart';

import '../../../../helpers/helpers.dart';
import '../../../../repositories/models/fetus/fetus_model.dart';

class ChecklistListState extends Equatable {
  final double scrollPosition;
  final ViewData<ChecklistListResponseModel> listChecklist;
  final ViewData<List<ChecklistItemModel>> listItem;
  final ViewData<ListFetusResponseModel> listFetus;
  final ViewData<List<Map<String, dynamic>>> menu;
  final int selectedFetus;
  final int selectedSubCategory;
  final int page;

  ChecklistListState({
    this.scrollPosition = 0,
    this.listChecklist = const ViewData(),
    this.listItem = const ViewData(),
    this.listFetus = const ViewData(),
    this.menu = const ViewData(),
    this.selectedFetus = 0,
    this.selectedSubCategory = 0,
    this.page = 1,
  });

  ChecklistListState copyWith(
      {double? scrollPosition,
      ViewData<ChecklistListResponseModel>? listChecklist,
      ViewData<List<ChecklistItemModel>>? listItem,
      ViewData<ListFetusResponseModel>? listFetus,
      ViewData<List<Map<String, dynamic>>>? menu,
      int? selectedFetus,
      int? selectedSubCategory,
      int? page}) {
    return ChecklistListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      listChecklist: listChecklist ?? this.listChecklist,
      listItem: listItem ?? this.listItem,
      listFetus: listFetus ?? this.listFetus,
      menu: menu ?? this.menu,
      selectedFetus: selectedFetus ?? this.selectedFetus,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      page: page ?? this.page,
    );
  }

  @override
  List get props => [
        scrollPosition,
        listChecklist,
        listItem,
        listFetus,
        menu,
        selectedFetus,
        selectedSubCategory
      ];
}
