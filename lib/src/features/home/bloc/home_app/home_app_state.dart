import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';

class HomeAppState extends Equatable {
  final double scrollPosition;
  final ViewData<List<ArticleModel>> listArticle;
  ViewData<List<Map<String, dynamic>>> menu;

  HomeAppState({
    this.scrollPosition = 0,
    this.listArticle = const ViewData(),
    this.menu = const ViewData(),
  });

  HomeAppState copyWith({
    double? scrollPosition,
    ViewData<List<ArticleModel>>? listArticle,
    ViewData<List<Map<String, dynamic>>>? menu,
  }) {
    return HomeAppState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      listArticle: listArticle ?? this.listArticle,
      menu: menu ?? this.menu,
    );
  }

  @override
  List get props => [scrollPosition, listArticle, menu];
}
