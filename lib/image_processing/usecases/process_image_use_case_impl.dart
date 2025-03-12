import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';
import 'package:ocr_app_flutter/image_processing/presentation/interfaces/process_image_use_case.dart';
import 'package:ocr_app_flutter/image_processing/usecases/interfaces/image_processing_manager.dart';

class ProcessImageUseCaseImpl extends ProcessImageUseCase {
  final ImageProcessingManager repository;

  ProcessImageUseCaseImpl(this.repository);

  @override
  Future<Result<String, UiError>> processImage(String imagePath) async {
    final result = await repository.processImage(imagePath);
    if (result.isFailure) {
      final String errorMsg = result.error.toString();
      final UiError error = UiError(message: errorMsg);
      return Result(error: error);
    }
    return Result(value: result.value);
  }
}
