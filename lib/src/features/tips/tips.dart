export 'bloc/bloc.dart';
export 'ui/ui.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';

class TipsFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: TipsListScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const TipsListScreen();
        },
      ),
      GoRoute(
        path: TipsDetailScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return TipsDetailScreen(id: state.queryParameters['id'] ?? '', back: state.queryParameters['back']);
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    ///BLOC
    inject.registerFactory(() => TipsListBloc());
    inject.registerFactory(() => TipsDetailBloc());
  }
}
