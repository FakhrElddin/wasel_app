import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/config/app_theme.dart';

import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const WaselApp());
}

class WaselApp extends StatelessWidget {
  const WaselApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        AppRoutes.splashScreenRoute: (context) => SplashScreen(),
      },
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
