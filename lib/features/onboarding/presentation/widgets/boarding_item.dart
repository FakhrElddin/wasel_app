import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/onboarding/model/onboarding_model.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({super.key, required this.onboardingModel});

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Center(child: SvgPicture.asset(onboardingModel.image))),
        const SizedBox(height: 32),
        Text(
          onboardingModel.title,
          style: AppStyles.bold24Text,
        ),
        const SizedBox(height: 16),
        Text(
          onboardingModel.body,
          style: AppStyles.regular16Text,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
