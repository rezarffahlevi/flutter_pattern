export 'bloc/bloc.dart';
export 'ui/ui.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/checklist/bloc/bloc.dart';
import 'package:temanbumil_web/src/features/checklist/ui/ui.dart';
import 'package:temanbumil_web/src/features/features.dart';

class ChecklistFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: ChecklistListScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ChecklistListScreen();
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    ///BLOC
    inject.registerFactory(() => ChecklistListBloc());
  }
}
