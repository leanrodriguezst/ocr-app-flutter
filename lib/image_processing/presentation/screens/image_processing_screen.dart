import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app_flutter/image_processing/di/image_processing_module.dart';
import 'package:ocr_app_flutter/image_processing/presentation/bloc/image_processing_bloc.dart';
import 'package:ocr_app_flutter/image_processing/presentation/viewstates/image_processing_view_state.dart';

class ImageProcessingScreen extends StatelessWidget {
  final String imagePath;

  const ImageProcessingScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ImageProcessingBloc>(),
      child: BlocBuilder<ImageProcessingBloc, ImageProcessingState>(
        builder: (context, state) {
          return _ImageProcessingView(
            imagePath: imagePath,
            context: context,
            state: state,
          );
        },
      ),
    );
  }
}

class _ImageProcessingView extends StatefulWidget {
  final String imagePath;
  final BuildContext context;
  final ImageProcessingState state;

  const _ImageProcessingView({
    required this.imagePath,
    required this.context,
    required this.state,
  });

  @override
  State<_ImageProcessingView> createState() => _ImageProcessingViewState();
}

class _ImageProcessingViewState extends State<_ImageProcessingView> {
  @override
  void initState() {
    context.read<ImageProcessingBloc>().add(ProcessImage(widget.imagePath));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Procesando imagen')),
      body: switch (widget.state.viewState) {
        LoadingState() => const Center(child: CircularProgressIndicator()),
        ErrorState() => throw UnimplementedError(),
        ReadyState() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(widget.state.processedText)],
        ),
      },
    );
  }
}
