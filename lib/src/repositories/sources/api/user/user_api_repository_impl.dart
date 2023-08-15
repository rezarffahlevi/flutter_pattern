import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/sources/api/api.dart';

class UserApiRepositoryImpl implements UserApiRepository {
  final Dio? dio;

  UserApiRepositoryImpl({required this.dio});

  @override
  Future<String> test({
    String? title,
  }) async {
    return '';
  }
}
