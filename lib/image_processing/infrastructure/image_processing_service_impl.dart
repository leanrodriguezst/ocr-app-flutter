import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ocr_app_flutter/core/utils/result.dart';
import 'package:ocr_app_flutter/image_processing/data/interfaces/image_processing_service.dart';

class ImageProcessingServiceImpl extends ImageProcessingService {
  final TextRecognizer _textRecognizer;

  ImageProcessingServiceImpl(this._textRecognizer);

  // @override
  // Future<Result<String, Exception>> processImage(String imagePath) async {
  //   final InputImage inputImage = InputImage.fromFilePath(imagePath);
  //   try {
  //     final RecognizedText recognizedText = await _textRecognizer.processImage(
  //       inputImage,
  //     );
  //     final String text = recognizedText.text;
  //     return Result(value: text);
  //   } on Exception catch (e) {
  //     return Result(error: e);
  //   }
  // }

  @override
  Future<Result<String, Exception>> processImage(String imagePath) async {
    try {
      final String text = await FlutterTesseractOcr.extractText(
        imagePath,
        language: 'eng+spa',
        args: {"preserve_interword_spaces": "1"},
      );
      return Result(value: text);
    } catch (e) {
      return Result(error: e as Exception);
    }
  }
}
