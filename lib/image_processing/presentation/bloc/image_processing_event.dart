part of 'image_processing_bloc.dart';

abstract class ImageProcessingEvent {
  const ImageProcessingEvent();
}

class ProcessImage extends ImageProcessingEvent {
  final String imagePath;
  const ProcessImage(this.imagePath);
}
