import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';
import 'package:ocr_app_flutter/core/presentation/widgets/error_dialog.dart';
import 'package:ocr_app_flutter/image_processing/presentation/bloc/image_processing_bloc.dart';
import 'package:ocr_app_flutter/image_processing/presentation/viewstates/image_processing_view_state.dart';

class ImageProcessingScreen extends StatelessWidget {
  final String imagePath;

  const ImageProcessingScreen({super.key, required this.imagePath});

  void handleListener(BuildContext context, ImageProcessingState state) {
    final viewState = state.viewState;
    if (viewState is ErrorState) {
      showAlertDialog(context, viewState.error);
    }
  }

  void showAlertDialog(BuildContext context, UiError error) {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(error: error, onAccept: () => onAccept(context));
      },
    );
  }

  void onAccept(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ImageProcessingBloc>(),
      child: BlocConsumer<ImageProcessingBloc, ImageProcessingState>(
        listenWhen: (previous, current) => current.viewState is ErrorState,
        listener: (context, state) => handleListener(context, state),
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
    Widget body;

    switch (widget.state.viewState) {
      case LoadingState():
        body = const Center(child: CircularProgressIndicator());
        break;
      case ErrorState():
        body = const SizedBox(height: 20);
        break;
      case ReadyState():
        body = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(widget.state.processedText)],
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Procesando imagen')),
      body: body,
    );
  }
}
