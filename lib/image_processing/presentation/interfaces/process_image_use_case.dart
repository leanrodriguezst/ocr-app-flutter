import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';

abstract class ProcessImageUseCase {
  Future<Result<String, UiError>> processImage(String imagePath);
}