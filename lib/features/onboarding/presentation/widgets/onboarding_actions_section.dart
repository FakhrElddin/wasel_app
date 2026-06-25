import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/components/custom_floating_action_button.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/custom_smooth_page_indicator.dart';

class OnboardingActionsSection extends StatelessWidget {
  const OnboardingActionsSection({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.onboardingLength,
    required this.boardingController,
  });

  final bool isFirst;
  final bool isLast;
  final int onboardingLength;
  final PageController boardingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFloatingActionButton(
          heroTag: AppStrings.btn1String,
          onPressed: () {
            if (isFirst == false) {
              boardingController.previousPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            } else {}
          },
          child: const Icon(Icons.arrow_back, color: AppColors.whiteColor),
        ),
        CustomSmoothPageIndicator(
          controller: boardingController,
          count: onboardingLength,
        ),
        CustomFloatingActionButton(
          heroTag: AppStrings.btn2String,
          onPressed: () {
            if (isLast == false) {
              boardingController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            } else {
              SharedPrefsUtils.saveData(
                key: AppConstants.onboarding,
                value: false,
              );
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.loginScreenRoute,
              );
            }
          },
          child: const Icon(Icons.arrow_forward, color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
