part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class Login extends LoginEvent {
  final String email;
  final String password;

  const Login(this.email, this.password);
}
