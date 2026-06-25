import 'package:flutter/material.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/onboarding_screen_body.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/onboarding_skip_button.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          OnboardingSkipButton(),
        ],
      ),
      body: OnboardingScreenBody(),
    );
  }
}
