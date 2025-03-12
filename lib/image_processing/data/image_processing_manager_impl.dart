import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';
import 'package:ocr_app_flutter/image_processing/usecases/interfaces/image_processing_manager.dart';

class ImageProcessingManagerImpl extends ImageProcessingManager {
  final ImageProcessingService service;

  ImageProcessingManagerImpl(this.service);

  @override
  Future<String> processImage(String imagePath) {
    return service.processImage(imagePath);
  }
}
