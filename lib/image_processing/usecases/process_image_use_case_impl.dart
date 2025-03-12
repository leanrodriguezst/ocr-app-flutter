import 'package:ocr_app_flutter/image_processing/presentation/interfaces/process_image_use_case.dart';
import 'package:ocr_app_flutter/image_processing/usecases/interfaces/image_processing_manager.dart';

class ProcessImageUseCaseImpl extends ProcessImageUseCase {
  final ImageProcessingManager repository;

  ProcessImageUseCaseImpl(this.repository);

  @override
  Future<String> processImage(String imagePath) {
    return repository.processImage(imagePath);
  }
}
