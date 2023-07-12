import 'package:equatable/equatable.dart';

class AuthLoginState extends Equatable {
  final String? message;

  const AuthLoginState({
    this.message,
  });

  AuthLoginState copyWith({
    String? message,
  }) {
    return AuthLoginState(
      message: message ?? this.message,
    );
  }

  @override
  List get props => [
        message,
      ];
}
