import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ocr_app_flutter/home/infrastructure/camera_gallery_service_impl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OCR App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              label: const Text('Escanear imagen'),
              icon: const Icon(Icons.camera),
              onPressed: () async {
                final photoPath = await CameraGalleryServiceImpl().takePhoto();
                if (photoPath == null) return;
                if (context.mounted) {
                  context.push('/text-processing', extra: photoPath);
                }
              },
            ),
            TextButton.icon(
              label: const Text('Abrir galería'),
              icon: const Icon(Icons.photo),
              onPressed: () async {
                final photoPath = await CameraGalleryServiceImpl().pickImage();
                if (photoPath == null) return;
                if (context.mounted) {
                  context.push('/text-processing', extra: photoPath);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
