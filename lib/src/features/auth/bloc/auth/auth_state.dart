import 'package:equatable/equatable.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class AuthState extends Equatable {
  final String? message;
  final RegisterByTypeEnum registerType;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? referralCode;

  const AuthState({
    this.message,
    this.registerType = RegisterByTypeEnum.EMAIL,
    this.email,
    this.password,
    this.phoneNumber,
    this.referralCode,
  });

  AuthState copyWith({
    String? message,
    RegisterByTypeEnum? registerType,
    String? email,
    String? password,
    String? phoneNumber,
    String? referralCode,
  }) {
    return AuthState(
      message: message ?? this.message,
      registerType: registerType ?? this.registerType,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      referralCode: referralCode ?? this.referralCode,
    );
  }

  @override
  List get props => [
        message,
        registerType,
        email,
        password,
        phoneNumber,
        referralCode,
      ];
}
