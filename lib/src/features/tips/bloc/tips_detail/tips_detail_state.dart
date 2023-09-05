import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/repositories/models/tips/tips_detail_response_model.dart';

import '../../../../helpers/helpers.dart';

class TipsDetailState extends Equatable {
  final double scrollPosition;
  final ViewData<TipsDetailResponseModel> detail;
  final ViewData<List<Map<String, dynamic>>> menu;
  final String? selectedCategory;

  const TipsDetailState({
    this.scrollPosition = 0,
    this.detail = const ViewData(),
    this.menu = const ViewData(),
    this.selectedCategory,
  });

  TipsDetailState copyWith({
    double? scrollPosition,
    ViewData<TipsDetailResponseModel>? detail,
    ViewData<List<Map<String, dynamic>>>? menu,
    String? selectedCategory,
  }) {
    return TipsDetailState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
      detail: detail ?? this.detail,
      menu: menu ?? this.menu,
    );
  }

  @override
  List get props => [scrollPosition, detail, menu, selectedCategory];
}
