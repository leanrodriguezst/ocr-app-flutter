import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';
import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';

class ImageProcessingServiceImpl extends ImageProcessingService {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  @override
  Future<Result<String, Exception>> processImage(String imagePath) async {
    final InputImage inputImage = InputImage.fromFilePath(imagePath);
    try {
      final RecognizedText recognizedText = await _textRecognizer.processImage(
        inputImage,
      );
      final String text = recognizedText.text;
      return Result(value: text);
    } on Exception catch (e) {
      return Result(error: e);
    }
  }
}
