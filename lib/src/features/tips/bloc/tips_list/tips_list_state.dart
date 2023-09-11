import 'package:equatable/equatable.dart';

import '../../../../helpers/helpers.dart';

import '../../../../repositories/models/article/article_model.dart';
import '../../../../repositories/models/tips/tips_list_response_model.dart';
import '../../../../repositories/repositories.dart';

class TipsListState extends Equatable {
  final double scrollPosition;
  final ViewData<List<TipsCategoryModel>> listCategory;
  final ViewData<List<TipsModel>> listTips;
  final ViewData<List<Map<String, dynamic>>> menu;
  final int selectedCategory;
  final int selectedSubCategory;
  final int page;

  TipsListState({
    this.scrollPosition = 0,
    this.listCategory = const ViewData(),
    this.listTips = const ViewData(),
    this.menu = const ViewData(),
    this.selectedCategory = 0,
    this.selectedSubCategory = 0,
    this.page = 1,
  });

  TipsListState copyWith(
      {double? scrollPosition,
      ViewData<List<TipsCategoryModel>>? listCategory,
      ViewData<List<TipsModel>>? listTips,
      ViewData<List<Map<String, dynamic>>>? menu,
      int? selectedCategory,
      int? selectedSubCategory,
      int? page}) {
    return TipsListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      listCategory: listCategory ?? this.listCategory,
      listTips: listTips ?? this.listTips,
      menu: menu ?? this.menu,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      page: page ?? this.page,
    );
  }

  @override
  List get props => [
        scrollPosition,
        listCategory,
        listTips,
        menu,
        selectedCategory,
        selectedSubCategory
      ];
}
