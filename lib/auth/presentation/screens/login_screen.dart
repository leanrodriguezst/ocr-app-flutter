import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ocr_app_flutter/auth/presentation/bloc/login_bloc.dart';
import 'package:ocr_app_flutter/auth/presentation/viewstates/login_view_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void handleErrorMessage(BuildContext context, LoginState state) {
    final viewState = state.viewState;
    if (viewState is ErrorState) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(viewState.error.message),
            actions: [
              TextButton(
                onPressed: () {
                  //Dismiss
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listenWhen:
            (previous, current) =>
                current.viewState is ErrorState ||
                current.viewState is LoadingState,
        listener: (context, state) => handleErrorMessage(context, state),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Login')),
            body:
                state.viewState is LoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : const _LoginView(),
          );
        },
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            initialValue: context.read<LoginBloc>().state.username,
            onChanged:
                (username) =>
                    context.read<LoginBloc>().add(UsernameChanged(username)),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: context.read<LoginBloc>().state.password,
            onChanged:
                (password) =>
                    context.read<LoginBloc>().add(PasswordChanged(password)),
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              context.read<LoginBloc>().add(const FormSubmit());
            },
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
