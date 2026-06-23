import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/config/app_theme.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/my_bloc_observer.dart';
import 'package:wasel_app/features/auth/login/presentation/screens/login_screen.dart';
import 'package:wasel_app/features/auth/register/presentation/screens/register_screen.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/screens/verify_code_screen.dart';
import 'package:wasel_app/features/onboarding/presentation/screens/onboarding_screen.dart';

import 'features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
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
        AppRoutes.registerScreenRoute: (context) => RegisterScreen(),
        AppRoutes.forgetPasswordScreenRoute: (context) => ForgetPasswordScreen(),
        AppRoutes.verifyCodeScreenRoute: (context) => VerifyCodeScreen(),
        AppRoutes.resetPasswordScreenRoute: (context) => ResetPasswordScreen(),
      },
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
