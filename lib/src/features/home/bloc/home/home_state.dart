import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class HomeState extends Equatable {
  final double scrollPosition;

  const HomeState({
    this.scrollPosition = 0,
  });

  HomeState copyWith({
    double? scrollPosition,
  }) {
    return HomeState(
      scrollPosition: scrollPosition ?? this.scrollPosition,
    );
  }

  @override
  List get props => [
        scrollPosition,
      ];
}
