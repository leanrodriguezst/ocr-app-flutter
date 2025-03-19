import 'package:ocr_app_flutter/core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<String, Exception>> login(String email, String password);
}
