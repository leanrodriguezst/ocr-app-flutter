import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app_flutter/image_processing/presentation/interfaces/process_image_use_case.dart';
import 'package:ocr_app_flutter/image_processing/presentation/viewstates/image_processing_view_state.dart';

part 'image_processing_event.dart';
part 'image_processing_state.dart';

class ImageProcessingBloc
    extends Bloc<ImageProcessingEvent, ImageProcessingState> {
  final ProcessImageUseCase processImageUseCase;

  ImageProcessingBloc(this.processImageUseCase)
    : super(const ImageProcessingState()) {
    on<ProcessImage>(_processImage);
  }

  Future<void> _processImage(
    ProcessImage event,
    Emitter<ImageProcessingState> emit,
  ) async {
    emit(state.copyWith(viewState: const LoadingState()));
    final imagePath = event.imagePath;
    final text = await processImageUseCase.processImage(imagePath);
    emit(state.copyWith(processedText: text, viewState: const ReadyState()));
  }
}
