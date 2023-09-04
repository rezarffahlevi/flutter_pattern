import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class TipsListState extends Equatable {
  final double scrollPosition;
  final ViewData<List<ArticleModel>> listArticle;
  final ViewData<List<TipsModel>> listTips;
  final ViewData<List<Map<String, dynamic>>> menu;
  final String? selectedCategory;

  TipsListState({
    this.scrollPosition = 0,
    this.listArticle = const ViewData(),
    this.listTips = const ViewData(),
    this.menu = const ViewData(),
    this.selectedCategory,
  });

  TipsListState copyWith({
    double? scrollPosition,
    ViewData<List<ArticleModel>>? listArticle,
    ViewData<List<TipsModel>>? listTips,
    ViewData<List<Map<String, dynamic>>>? menu,
    String? selectedCategory,
  }) {
    return TipsListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      listArticle: listArticle ?? this.listArticle,
      listTips: listTips ?? this.listTips,
      menu: menu ?? this.menu,
      selectedCategory: selectedCategory == ''
          ? null
          : selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List get props =>
      [scrollPosition, listArticle, listTips, menu, selectedCategory];
}
