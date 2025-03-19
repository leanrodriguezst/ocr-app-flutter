import 'package:ocr_app_flutter/auth/presentation/interfaces/login_use_case.dart';
import 'package:ocr_app_flutter/auth/usecases/interfaces/auth_repository.dart';
import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';

class LoginUseCaseImpl extends LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCaseImpl(this._authRepository);

  @override
  Future<Result<String, UiError>> login(String email, String password) async {
    final loginResult = await _authRepository.login(email, password);
    if (loginResult.isFailure) {
      final String errorMsg = loginResult.error.toString();
      final UiError error = UiError(message: errorMsg);
      return Result(error: error);
    }
    return Result(value: loginResult.value);
  }
}
