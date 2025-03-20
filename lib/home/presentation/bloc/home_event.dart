part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class TakePhoto extends HomeEvent {
  const TakePhoto();
}

class PickImage extends HomeEvent {
  const PickImage();
}
