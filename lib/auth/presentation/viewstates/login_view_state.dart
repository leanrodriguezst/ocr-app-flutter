import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';

sealed class LoginViewState {
  const LoginViewState();
}

class LoadingState extends LoginViewState {
  const LoadingState();
}

class ErrorState extends LoginViewState {
  final UiError error;

  ErrorState(this.error);
}

class ReadyState extends LoginViewState {
  const ReadyState();
}
