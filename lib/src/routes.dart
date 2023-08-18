import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/features.dart';

class Routes {
  static List<RouteBase> appRoutes() {
    return [
        ...CommonFeature.appRoutes(),
        ...AuthFeature.appRoutes(),
        ...HomeFeature.appRoutes(),
        ...ArticleFeature.appRoutes(),
      ];
  }
}
