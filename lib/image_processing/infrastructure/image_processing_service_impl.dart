import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';

class ImageProcessingServiceImpl extends ImageProcessingService {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  @override
  Future<String> processImage(String imagePath) async {
    final InputImage inputImage = InputImage.fromFilePath(imagePath);
    final RecognizedText recognizedText = await _textRecognizer.processImage(
      inputImage,
    );
    final String text = recognizedText.text;
    return text;
  }
}
