import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class AuthApiRepositoryImpl implements AuthApiRepository {
  final Dio? dio;

  AuthApiRepositoryImpl({required this.dio});

  @override
  Future<AuthLoginResponseModel> login({
    String? email,
    String? password,
  }) async {
    try {
      final request = AuthLoginResponseModel.generateParamsV2(
          email: email, password: password);
      final res = await dio!.post(
        '/login/v2/',
         
        data: request,
      );
      return AuthLoginResponseModel.fromJson(res.data);
    } on DioException catch (e, s) {
      throw Exception(e.message);
    }
  }
}
