part of 'image_processing_bloc.dart';

class ImageProcessingState extends Equatable {
  final String processedText;
  final ImageProcessingViewState viewState;

  const ImageProcessingState({this.processedText = '', this.viewState = const ReadyState()});

  @override
  List<Object?> get props => [processedText, viewState];

  ImageProcessingState copyWith({String? processedText, ImageProcessingViewState? viewState}) {
    return ImageProcessingState(
      processedText: processedText ?? this.processedText,
      viewState: viewState ?? this.viewState,
    );
  }
}
