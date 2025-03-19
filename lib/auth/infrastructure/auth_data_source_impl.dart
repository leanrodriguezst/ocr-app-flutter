import 'package:dio/dio.dart';
import 'package:ocr_app_flutter/auth/data/datasources/auth_data_source.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final Dio _dio;

  AuthDataSourceImpl(this._dio);

  @override
  Future<Result<String, Exception>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );
      final token = response.data['token'];
      return Result(value: token);
    } catch (e) {
      return Result(error: Exception(e.toString()));
    }
  }
}
