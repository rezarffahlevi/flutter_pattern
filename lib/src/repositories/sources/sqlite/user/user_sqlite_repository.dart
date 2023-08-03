import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class UserSqliteRepositoryImpl implements UserSqliteRepository {
  final Dio? dio;

  UserSqliteRepositoryImpl({required this.dio});

  @override
  Future<String> test({
    String? title,
  }) async {
    return '';
  }
}
