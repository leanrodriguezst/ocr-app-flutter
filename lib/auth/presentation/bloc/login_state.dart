part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String token;
  final String username;
  final String password;

  final LoginViewState viewState;
  final LoginNavigatorState? navigatorState;

  const LoginState({
    this.token = '',
    this.username = '',
    this.password = '',
    this.viewState = const ReadyState(),
    this.navigatorState,
  });

  @override
  List<Object> get props => [token, username, password, viewState];

  LoginState copyWith({
    String? token,
    String? username,
    String? password,
    LoginViewState? viewState,
    LoginNavigatorState? navigatorState,
  }) {
    return LoginState(
      token: token ?? this.token,
      username: username ?? this.username,
      password: password ?? this.password,
      viewState: viewState ?? this.viewState,
      navigatorState: navigatorState ?? this.navigatorState,
    );
  }
}
