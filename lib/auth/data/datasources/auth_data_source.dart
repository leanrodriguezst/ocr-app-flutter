import 'package:ocr_app_flutter/core/utils/result.dart';

abstract class AuthDataSource {
  Future<Result<String, Exception>> login(String email, String password);
}
