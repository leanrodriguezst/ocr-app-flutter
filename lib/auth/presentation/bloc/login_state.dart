part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String token;

  const LoginState({this.token = ''});

  @override
  List<Object> get props => [token];

  LoginState copyWith({String? token}) {
    return LoginState(token: token ?? this.token);
  }
}
