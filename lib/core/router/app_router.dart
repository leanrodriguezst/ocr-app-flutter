import 'package:go_router/go_router.dart';
import 'package:ocr_app_flutter/home/presentation/home_screen.dart';
import 'package:ocr_app_flutter/image_processing/presentation/screens/image_processing_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/text-processing',
      builder: (context, state) {
        String imagePath = state.extra as String;
        return ImageProcessingScreen(imagePath: imagePath);
      },
    ),
  ],
);
