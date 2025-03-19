import 'package:flutter/material.dart';
import 'package:ocr_app_flutter/core/presentation/models/ui_error.dart';

class ErrorDialog extends StatelessWidget {
  final UiError error;
  final VoidCallback onAccept;

  const ErrorDialog({super.key, required this.error, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error.title),
      content: Text(error.message),
      actions: [
        TextButton(
          onPressed: onAccept,
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
