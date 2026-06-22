import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_Strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/onboarding_screen_body.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.skipStringCapital,
                style: AppStyles.bold14Text,
              ),
            ),
          ),
        ],
      ),
      body: OnboardingScreenBody(),
    );
  }
}
