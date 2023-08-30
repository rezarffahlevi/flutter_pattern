import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/repositories/sources/remote/api/api.dart';

class HomeRootBloc extends Cubit<HomeRootState> {
  HomeRootBloc() : super(HomeRootState());

  final repo = inject<AuthApiRepository>();

  final ScrollController scrollController = ScrollController();
  double opacity = 0;

  init(BuildContext context) {}

  setIndex({int index = 0}) async {
    emit(state.copyWith(index: index));
  }
}
