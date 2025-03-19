import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ocr_app_flutter/auth/di/auth_module.dart';
import 'package:ocr_app_flutter/core/constants/environment.dart';
import 'package:ocr_app_flutter/image_processing/di/image_processing_module.dart';

void setupCoreModule() {
  GetIt.I.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: Environment.apiUrl)),
  );
  setupAuthModule();
  setupImageProcessingModule();
}
