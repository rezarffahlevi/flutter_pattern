import 'package:equatable/equatable.dart';

class GlobalSplashState extends Equatable {
  final String? message;

  const GlobalSplashState({
    this.message,
  });

  GlobalSplashState copyWith({
    String? message,
  }) {
    return GlobalSplashState(
      message: message ?? this.message,
    );
  }

  @override
  List get props => [
        message,
      ];
}
