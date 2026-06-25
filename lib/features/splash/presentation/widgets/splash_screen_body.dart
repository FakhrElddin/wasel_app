import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _ProfessionalSplashScreenState();
}

class _ProfessionalSplashScreenState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _logoSlideAnimation;
  late Animation<double> _logoFadeAnimation;
  bool? showOnboardingScreen =
      SharedPrefsUtils.getData(key: AppConstants.onboarding) as bool?;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _logoSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -2.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.7, curve: Curves.bounceOut),
          ),
        );

    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();

    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(
        context,
        showOnboardingScreen == null
            ? AppRoutes.onboardingScreenRoute
            : AppRoutes.loginScreenRoute,
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoSlideAnimation,
              child: FadeTransition(
                opacity: _logoFadeAnimation,
                child: Image.asset(
                  AppImages.logoImage,
                  width: 180,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  AppStrings.waselStringCapital,
                  speed: const Duration(milliseconds: 200),
                  textStyle: AppStyles.bold38Text,
                  cursor: '',
                ),
              ],
              totalRepeatCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}
