import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ocr_app_flutter/core/presentation/viewstates/base_view_state.dart';
import 'package:ocr_app_flutter/home/presentation/bloc/home_bloc.dart';
import 'package:ocr_app_flutter/home/presentation/navigatorstates/home_navigator_state.dart';
import 'package:ocr_app_flutter/home/presentation/viewstates/home_view_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleListener(BuildContext context, HomeState state) {
    _handleNavigatorState(context, state);
  }

  void _handleNavigatorState(BuildContext context, HomeState state) {
    final navigatorState = state.navigatorState;
    if (navigatorState is GoToImageProcessing) {
      final photoPath = state.photoPath;
      context.push('/text-processing', extra: photoPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen:
            (previous, current) =>
                current.navigatorState is GoToImageProcessing ||
                current.viewState is Error ||
                current.viewState is Loading,
        listener: (context, state) => _handleListener(context, state),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('OCR App')),
            body:
                state.viewState == const HomeLoading()
                    ? const Center(child: CircularProgressIndicator())
                    : const _HomeView(),
          );
        },
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            label: const Text('Escanear imagen'),
            icon: const Icon(Icons.camera),
            onPressed: () {
              context.read<HomeBloc>().add(const TakePhoto());
              // final photoPath =
              //     await CameraGalleryServiceImpl().takePhoto();
              // if (photoPath == null) return;
              // if (context.mounted) {
              //   context.push('/text-processing', extra: photoPath);
              // }
            },
          ),
          TextButton.icon(
            label: const Text('Abrir galería'),
            icon: const Icon(Icons.photo),
            onPressed: () {
              context.read<HomeBloc>().add(const PickImage());
              // final photoPath =
              //     await CameraGalleryServiceImpl().pickImage();
              // if (photoPath == null) return;
              // if (context.mounted) {
              //   context.push('/text-processing', extra: photoPath);
              // }
            },
          ),
        ],
      ),
    );
  }
}
