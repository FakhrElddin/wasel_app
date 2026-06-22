import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/utils/app_Strings.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
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
              onPressed: () {
                SharedPrefsUtils.saveData(
                    key: AppConstants.onboarding,
                    value: false,
                );
                Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
              },
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
