import 'package:get_it/get_it.dart';
import '../../../repositories.dart';

export 'common/common_api_repository_impl.dart';
export 'common/common_api_repository.dart';

export 'user/user_api_repository_impl.dart';
export 'user/user_api_repository.dart';

export 'auth/auth_api_repository_impl.dart';
export 'auth/auth_api_repository.dart';

export 'article/article_api_repository.dart';
export 'article/article_api_repository_impl.dart';

class ApiSources {
  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    inject.registerLazySingleton<CommonApiRepository>(
        () => CommonApiRepositoryImpl(dio: inject()));

    inject.registerLazySingleton<AuthApiRepository>(
        () => AuthApiRepositoryImpl(dio: inject()));

    inject.registerLazySingleton<ArticleApiRepository>(
        () => ArticleApiRepositoryImpl(dio: inject(), mocky: inject(instanceName: 'mocky')));
  }
}
