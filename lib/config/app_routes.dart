import 'package:flutter/material.dart';
import 'package:wasel_app/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:wasel_app/features/auth/login/presentation/screens/login_screen.dart';
import 'package:wasel_app/features/auth/register/presentation/screens/register_screen.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/screens/verify_code_screen.dart';
import 'package:wasel_app/features/home/presentation/screens/home_screen.dart';
import 'package:wasel_app/features/home_tab/presentation/screens/book_details_screen.dart';
import 'package:wasel_app/features/my_books_tab/presentation/screens/add_book_screen.dart';
import 'package:wasel_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:wasel_app/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashScreenRoute = 'splashRoute';
  static const String onboardingScreenRoute = 'onboardingRoute';
  static const String loginScreenRoute = ' loginRoute';
  static const String registerScreenRoute = 'registerRoute';
  static const String forgetPasswordScreenRoute = 'forgetPasswordRoute';
  static const String verifyCodeScreenRoute = 'verifyCodeRoute';
  static const String resetPasswordScreenRoute = 'resetPasswordRoute';
  static const String homeScreenRoute = 'homeRoute';
  static const String addBookScreenRoute = 'addBookRoute';
  static const String bookDetailsScreenRoute = 'bookDetailsRoute';


  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splashScreenRoute: (context) => SplashScreen(),
    AppRoutes.onboardingScreenRoute: (context) => OnboardingScreen(),
    AppRoutes.loginScreenRoute: (context) => LoginScreen(),
    AppRoutes.registerScreenRoute: (context) => RegisterScreen(),
    AppRoutes.forgetPasswordScreenRoute: (context) => ForgetPasswordScreen(),
    AppRoutes.verifyCodeScreenRoute: (context) => VerifyCodeScreen(),
    AppRoutes.resetPasswordScreenRoute: (context) => ResetPasswordScreen(),
    AppRoutes.homeScreenRoute: (context) => HomeScreen(),
    AppRoutes.addBookScreenRoute: (context) => AddBookScreen(),
    AppRoutes.bookDetailsScreenRoute: (context) => BookDetailsScreen(),
  };
}