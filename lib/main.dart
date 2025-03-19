import 'package:flutter/material.dart';
import 'package:ocr_app_flutter/core/constants/environment.dart';
import 'package:ocr_app_flutter/core/di/core_module.dart';
import 'package:ocr_app_flutter/core/router/app_router.dart';

void main() async {
  await Environment.initEnv();
  setupCoreModule();
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
