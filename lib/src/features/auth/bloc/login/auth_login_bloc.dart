import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/sources/api/api.dart';

class AuthLoginBloc extends Cubit<AuthLoginState> {
  AuthLoginBloc() : super(AuthLoginState());

  final repo = inject<AuthApiRepository>();

  init() {}

  eventChangeRegisterType(RegisterByTypeEnum type) {
    emit(state.copyWith(registerType: type));
  }

  eventOnTextChange(String? type, String? value) {
    switch (type) {
      case 'password':
        emit(state.copyWith(password: value));
        break;
      default:
        emit(state.copyWith(email: value));
        break;
    }
  }

  eventOnLoginEmail(context) async {
    try {
      Helper.showLoadingPopup(context);
      final res =
          await repo.login(email: state.email, password: state.password);
      AuthHelper.loginHandler(context, res);
    } catch (e) {
      Helper.showToast('Email atau password salah');
    } finally {
      Helper.dismissLoadingPopup(context);
    }
  }
}
