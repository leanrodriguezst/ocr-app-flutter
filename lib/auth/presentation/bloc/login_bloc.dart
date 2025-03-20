import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app_flutter/auth/presentation/interfaces/login_use_case.dart';
import 'package:ocr_app_flutter/auth/presentation/viewstates/login_view_state.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginState()) {
    on<FormSubmit>(_login);
    on<UsernameChanged>(_usernameChanged);
    on<PasswordChanged>(_passwordChanged);
  }

  Future<void> _login(FormSubmit event, Emitter<LoginState> emit) async {
    emit(state.copyWith(viewState: const LoadingState()));
    final email = state.username;
    final password = state.password;
    final result = await _loginUseCase.login(email, password);
    if (result.isFailure) {
      emit(state.copyWith(viewState: ErrorState(result.error!)));
      return;
    }
    emit(state.copyWith(token: result.value, viewState: const ReadyState()));
  }

  void _usernameChanged(UsernameChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(username: event.username, viewState: const ReadyState()),
    );
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(password: event.password, viewState: const ReadyState()),
    );
  }
}
