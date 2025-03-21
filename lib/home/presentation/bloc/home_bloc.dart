import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app_flutter/home/data/interfaces/camera_gallery_service.dart';
import 'package:ocr_app_flutter/home/presentation/navigatorstates/home_navigator_state.dart';
import 'package:ocr_app_flutter/home/presentation/viewstates/home_view_state.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CameraGalleryService _cameraGalleryService;

  HomeBloc(this._cameraGalleryService) : super(const HomeState()) {
    on<TakePhoto>(_onTakePhotoSelected);
    on<PickImage>(_onPickImageSelected);
  }
  void _onTakePhotoSelected(TakePhoto event, Emitter<HomeState> emit) async {
    emit(state.copyWith(viewState: const HomeLoading()));
    final photoPath = await _cameraGalleryService.takePhoto();
    if (photoPath == null) {
      emit(
        state.copyWith(viewState: const HomeError('Error al tomar la foto')),
      );
      return;
    }
    emit(
      state.copyWith(
        photoPath: photoPath,
        navigatorState: const GoToImageProcessing(),
        viewState: const HomeReady(),
      ),
    );
    // Reset navigator state
    emit(state.copyWith(navigatorState: null));
  }

  void _onPickImageSelected(PickImage event, Emitter<HomeState> emit) async {
    emit(state.copyWith(viewState: const HomeLoading()));
    final photoPath = await _cameraGalleryService.pickImage();
    if (photoPath == null) {
      emit(
        state.copyWith(
          viewState: const HomeError('Error al seleccionar la imagen'),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        photoPath: photoPath,
        navigatorState: const GoToImageProcessing(),
        viewState: const HomeReady(),
      ),
    );
    // Reset navigator state
    emit(state.copyWith(navigatorState: null));
  }
}
