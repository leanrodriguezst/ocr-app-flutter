sealed class ImageProcessingViewState {
  const ImageProcessingViewState();
}

class LoadingState extends ImageProcessingViewState {
  const LoadingState();
}

class ErrorState extends ImageProcessingViewState {
  final String message;

  ErrorState(this.message);
}

class ReadyState extends ImageProcessingViewState {
  const ReadyState();
}
