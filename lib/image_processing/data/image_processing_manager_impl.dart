import 'package:ocr_app_flutter/core/utils/result.dart';
import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';
import 'package:ocr_app_flutter/image_processing/usecases/interfaces/image_processing_manager.dart';

class ImageProcessingManagerImpl extends ImageProcessingManager {
  final ImageProcessingService service;

  ImageProcessingManagerImpl(this.service);

  @override
  Future<Result<String, Exception>> processImage(String imagePath) {
    final result = service.processImage(imagePath);
    return result;
  }
}
