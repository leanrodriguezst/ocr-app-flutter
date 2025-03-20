import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ocr_app_flutter/auth/data/auth_repository_impl.dart';
import 'package:ocr_app_flutter/auth/data/datasources/auth_data_source.dart';
import 'package:ocr_app_flutter/auth/infrastructure/auth_data_source_impl.dart';
import 'package:ocr_app_flutter/auth/presentation/bloc/login_bloc.dart';
import 'package:ocr_app_flutter/auth/presentation/interfaces/login_use_case.dart';
import 'package:ocr_app_flutter/auth/usecases/interfaces/auth_repository.dart';
import 'package:ocr_app_flutter/auth/usecases/login_use_case_impl.dart';
import 'package:ocr_app_flutter/core/usecases/interfaces/session_manager.dart';

void setupAuthModule() {
  GetIt.I.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(GetIt.I<Dio>()),
  );

  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(GetIt.I<AuthDataSource>()),
  );

  GetIt.I.registerLazySingleton<LoginUseCase>(
    () =>
        LoginUseCaseImpl(GetIt.I<AuthRepository>(), GetIt.I<SessionManager>()),
  );

  GetIt.I.registerFactory(() => LoginBloc(GetIt.I<LoginUseCase>()));
}
