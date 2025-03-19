import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';

abstract class LoginUseCase {
  Future<Result<String, UiError>> login(String email, String password);
}
