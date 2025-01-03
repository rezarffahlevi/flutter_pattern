export 'bloc/bloc.dart';
export 'ui/ui.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';

class ArticleFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: ArticleDetailScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return ArticleDetailScreen(detail: state.extra as ArticleModel?, id: state.queryParameters['id'] ?? '',);
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    ///BLOC
    inject.registerFactory(() => ArticleDetailBloc());
  }
}
