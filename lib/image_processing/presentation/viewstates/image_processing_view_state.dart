import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';

sealed class ImageProcessingViewState {
  const ImageProcessingViewState();
}

class LoadingState extends ImageProcessingViewState {
  const LoadingState();
}

class ErrorState extends ImageProcessingViewState {
  final UiError error;

  ErrorState(this.error);
}

class ReadyState extends ImageProcessingViewState {
  const ReadyState();
}
