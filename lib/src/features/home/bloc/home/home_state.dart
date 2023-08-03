import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';

class HomeState extends Equatable {
  final double scrollPosition;
  final Response<List<ArticleModel>> listData;

  const HomeState({
    this.scrollPosition = 0,
    this.listData = const Response(),
  });

  HomeState copyWith(
      {double? scrollPosition, Response<List<ArticleModel>>? listData}) {
    return HomeState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      listData: listData ?? this.listData,
    );
  }

  @override
  List get props => [
        scrollPosition,
        listData,
      ];
}
