import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app_flutter/auth/presentation/interfaces/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<Login>(_login);
  }

  Future<void> _login(Login event, Emitter<LoginState> emit) async {
    final result = await _loginUseCase.login(event.email, event.password);
    if (result.isFailure) {
      return;
    }
    emit(state.copyWith(token: result.value));
  }
}
