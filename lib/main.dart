import 'package:flutter/material.dart';
import 'package:ocr_app_flutter/core/router/app_router.dart';
import 'package:ocr_app_flutter/image_processing/di/image_processing_module.dart';

void main() {
  setupImageProcessingModule();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
