import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/tips/bloc/tips_detail/tips_detail_bloc.dart';
import 'package:temanbumil_web/src/features/tips/bloc/tips_list/tips_list_bloc.dart';
import 'package:temanbumil_web/src/features/tips/bloc/ui/ui.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

import 'bloc/ui/tips_list_screen.dart';

class TipsFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: TipsDetailScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return TipsDetailScreen(
            detail: state.extra as TipsModel?,
            id: state.queryParameters['id'] ?? '',
          );
        },
      ),
      GoRoute(
        path: TipsListScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return TipsListScreen(
            list: state.extra as TipsModel?,
            id: state.queryParameters['id'] ?? '',
          );
        },
      )
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    //bloc
    inject.registerFactory(() => TipsDetailBloc());
    inject.registerFactory(() => TipsListBloc());
  }
}
