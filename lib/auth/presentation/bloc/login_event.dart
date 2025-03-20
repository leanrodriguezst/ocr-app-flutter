part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class FormSubmit extends LoginEvent {
  const FormSubmit();
}

class UsernameChanged extends LoginEvent {
  final String username;

  const UsernameChanged(this.username);
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged(this.password);
}
