import 'package:get_it/get_it.dart';
import 'package:ocr_app_flutter/image_processing/data/image_processing_manager_impl.dart';
import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';
import 'package:ocr_app_flutter/image_processing/infrastructure/image_processing_service_impl.dart';
import 'package:ocr_app_flutter/image_processing/presentation/bloc/image_processing_bloc.dart';
import 'package:ocr_app_flutter/image_processing/presentation/interfaces/process_image_use_case.dart';
import 'package:ocr_app_flutter/image_processing/usecases/interfaces/image_processing_manager.dart';
import 'package:ocr_app_flutter/image_processing/usecases/process_image_use_case_impl.dart';

final getIt = GetIt.instance;

void setupImageProcessingModule() {
  getIt.registerLazySingleton<ImageProcessingService>(
    () => ImageProcessingServiceImpl(),
  );
  getIt.registerLazySingleton<ImageProcessingManager>(
    () => ImageProcessingManagerImpl(getIt<ImageProcessingService>()),
  );
  getIt.registerLazySingleton<ProcessImageUseCase>(
    () => ProcessImageUseCaseImpl(getIt<ImageProcessingManager>()),
  );
  getIt.registerFactory(
    () => ImageProcessingBloc(getIt<ProcessImageUseCase>()),
  );
}
