import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/config/app_theme.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/features/login/presentation/screens/login_screen.dart';
import 'package:wasel_app/features/onboarding/presentation/screens/onboarding_screen.dart';

import 'features/splash/presentation/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
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
        AppRoutes.onboardingScreenRoute: (context) => OnboardingScreen(),
        AppRoutes.loginScreenRoute: (context) => LoginScreen(),
      },
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
