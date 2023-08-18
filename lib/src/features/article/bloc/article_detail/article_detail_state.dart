import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/models/article/detail_article_response_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class ArticleDetailState extends Equatable {
  final double scrollPosition;
  final ViewData<DetailArticleResponseModel> detail;
  final ViewData<List<Map<String, dynamic>>> menu;
  final String? selectedCategory;

  ArticleDetailState({
    this.scrollPosition = 0,
    this.detail = const ViewData(),
    this.menu = const ViewData(),
    this.selectedCategory,
  });

  ArticleDetailState copyWith({
    double? scrollPosition,
    ViewData<DetailArticleResponseModel>? detail,
    ViewData<List<Map<String, dynamic>>>? menu,
    String? selectedCategory,
  }) {
    return ArticleDetailState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      detail: detail ?? this.detail,
      menu: menu ?? this.menu,
    );
  }

  @override
  List get props =>
      [scrollPosition, detail, menu, selectedCategory];
}
