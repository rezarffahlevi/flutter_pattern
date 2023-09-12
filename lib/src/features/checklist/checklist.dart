import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/checklist/bloc/checklist_list/checklist_bloc.dart';
import 'package:temanbumil_web/src/features/checklist/ui/checklist_screen.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/fetus_model.dart';

class ChecklistFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: ChecklistScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return ChecklistScreen(
            detail: state.extra as FetusModel?,
            id: state.queryParameters['id'] ?? '',
          );
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    //bloc
    inject.registerFactory(() => ChecklistListBloc());
  }
}
