import 'package:get_it/get_it.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

final inject = GetIt.instance;
Future<void> initInjection() async {
  // BLoC
  CommonFeature.initInjection();
  AuthFeature.initInjection();
  HomeFeature.initInjection();
  ArticleFeature.initInjection();
  TipsFeature.initInjection();

  // Repository
  ApiSources.initInjection();

  // Network
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(
      () => DioClient(baseUrl: 'https://run.mocky.io/').dio,
      instanceName: 'mocky');
  inject.registerLazySingleton(() => DioClient());
}
