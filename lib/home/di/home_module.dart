import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_app_flutter/home/data/interfaces/camera_gallery_service.dart';
import 'package:ocr_app_flutter/home/infrastructure/camera_gallery_service_impl.dart';
import 'package:ocr_app_flutter/home/presentation/bloc/home_bloc.dart';

void setupHomeModule() {
  GetIt.I.registerLazySingleton<CameraGalleryService>(
    () => CameraGalleryServiceImpl(ImagePicker()),
  );
  GetIt.I.registerFactory(() => HomeBloc(GetIt.I<CameraGalleryService>()));
}
