import 'package:ocr_app_flutter/core/utils/result.dart';

abstract class ImageProcessingManager {
  Future<Result<String, Exception>> processImage(String imagePath);
}