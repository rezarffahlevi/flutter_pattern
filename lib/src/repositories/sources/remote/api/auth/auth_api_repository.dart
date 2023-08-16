
import 'package:temanbumil_web/src/repositories/repositories.dart';

abstract class AuthApiRepository {
  Future<AuthLoginResponseModel> login({
    String? email,
    String? password,
  });
}
