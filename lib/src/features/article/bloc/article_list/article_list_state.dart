import 'package:equatable/equatable.dart';

import '../../../../helpers/helpers.dart';
import '../../../../repositories/models/article/article_category_model.dart';
import '../../../../repositories/models/article/article_model.dart';
import '../../../../repositories/models/models.dart';

class ArticleListState extends Equatable {
  final double scrollPosition;
  final ViewData<List<ArticleModel>> listArticle;
  final ViewData<List<ArticleCategoryModel>> listCategory;
  final ViewData<List<Map<String, dynamic>>> menu;
  final int selectedCategory;
  final int selectedSubCategory;
  final int page;

  ArticleListState({
    this.scrollPosition = 0,
    this.listArticle = const ViewData(),
    this.listCategory = const ViewData(),
    this.menu = const ViewData(),
    this.selectedCategory = 0,
    this.selectedSubCategory = 0,
    this.page = 1,
  });

  ArticleListState copyWith({
    double? scrollPosition,
    ViewData<List<ArticleModel>>? listArticle,
    ViewData<List<ArticleCategoryModel>>? listCategory,
    ViewData<List<Map<String, dynamic>>>? menu,
    int? selectedCategory,
    int? selectedSubCategory,
    int? page,
  }) {
    return ArticleListState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      listArticle: listArticle ?? this.listArticle,
      listCategory: listCategory ?? this.listCategory,
      menu: menu ?? this.menu,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      page: page ?? this.page,
    );
  }

  @override
  List get props => [
        scrollPosition,
        listArticle,
        listCategory,
        menu,
        selectedCategory,
        selectedSubCategory,
        page
      ];
}
