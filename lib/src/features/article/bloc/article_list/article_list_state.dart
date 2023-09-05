import 'package:equatable/equatable.dart';

import '../../../../helpers/helpers.dart';
import '../../../../repositories/models/models.dart';

class ArticleListState extends Equatable {
  final double scrollPosition;
  final ViewData<ArticleListResponseModel> list;
  final ViewData<List<Map<String, dynamic>>> menu;
  final String? selectedCategory;

  const ArticleListState(
      {this.scrollPosition = 0,
      this.list = const ViewData(),
      this.menu = const ViewData(),
      this.selectedCategory});

  ArticleListState copyWith({
    double? scrollPosition,
    ViewData<ArticleListResponseModel>? list,
    ViewData<List<Map<String, dynamic>>>? menu,
    String? selectedCategory,
  }) {
    return ArticleListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      list: list ?? this.list,
      menu: menu ?? this.menu,
    );
  }

  @override
  List get props => [scrollPosition, list, menu, selectedCategory];
}
