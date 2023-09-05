import 'package:equatable/equatable.dart';

import '../../../../helpers/helpers.dart';

import '../../../../repositories/models/tips/tips_list_response_model.dart';

class TipsListState extends Equatable {
  final double scrollPosition;
  final ViewData<TipsListResponseModel> list;
  final ViewData<List<Map<String, dynamic>>> menu;
  final String? selectedCategory;

  const TipsListState(
      {this.scrollPosition = 0,
      this.list = const ViewData(),
      this.menu = const ViewData(),
      this.selectedCategory});

  TipsListState copyWith({
    double? scrollPosition,
    ViewData<TipsListResponseModel>? list,
    ViewData<List<Map<String, dynamic>>>? menu,
    String? selectedCategory,
  }) {
    return TipsListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      list: list ?? this.list,
      menu: menu ?? this.menu,
    );
  }

  @override
  List get props => [scrollPosition, list, menu, selectedCategory];
}
