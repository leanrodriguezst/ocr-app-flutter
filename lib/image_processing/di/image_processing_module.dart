import 'package:get_it/get_it.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ocr_app_flutter/image_processing/data/image_processing_manager_impl.dart';
import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';
import 'package:ocr_app_flutter/image_processing/infrastructure/image_processing_service_impl.dart';
import 'package:ocr_app_flutter/image_processing/presentation/bloc/image_processing_bloc.dart';
import 'package:ocr_app_flutter/image_processing/presentation/interfaces/process_image_use_case.dart';
import 'package:ocr_app_flutter/image_processing/usecases/interfaces/image_processing_manager.dart';
import 'package:ocr_app_flutter/image_processing/usecases/process_image_use_case_impl.dart';

void setupImageProcessingModule() {
  GetIt.I.registerLazySingleton(
    () => TextRecognizer(script: TextRecognitionScript.latin),
  );

  GetIt.I.registerLazySingleton<ImageProcessingService>(
    () => ImageProcessingServiceImpl(GetIt.I<TextRecognizer>()),
  );

  GetIt.I.registerLazySingleton<ImageProcessingManager>(
    () => ImageProcessingManagerImpl(GetIt.I<ImageProcessingService>()),
  );

  GetIt.I.registerLazySingleton<ProcessImageUseCase>(
    () => ProcessImageUseCaseImpl(GetIt.I<ImageProcessingManager>()),
  );

  GetIt.I.registerFactory(
    () => ImageProcessingBloc(GetIt.I<ProcessImageUseCase>()),
  );
}
