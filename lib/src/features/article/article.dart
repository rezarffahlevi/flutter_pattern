import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/article/bloc/article_detail/article_detail_bloc.dart';
import 'package:temanbumil_web/src/features/article/ui/article_detail_screen.dart';
import 'package:temanbumil_web/src/features/article/ui/article_list_screen.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';

export 'bloc/bloc.dart';
export 'ui/ui.dart';

class ArticleFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: ArticleDetailScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return ArticleDetailScreen(
            detail: state.extra as ArticleModel?,
            id: state.queryParameters['id'] ?? '',
          );
        },
      ),
      GoRoute(
        path: ArticleListScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ArticleListScreen();
        },
      )
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    //bloc
    inject.registerFactory(() => ArticleDetailBloc());
    inject.registerFactory(() => ArticleListBloc());
  }
}
