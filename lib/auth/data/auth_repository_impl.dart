import 'package:ocr_app_flutter/auth/data/datasources/auth_data_source.dart';
import 'package:ocr_app_flutter/auth/usecases/interfaces/auth_repository.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Result<String, Exception>> login(String email, String password) {
    return _authDataSource.login(email, password);
  }
}
