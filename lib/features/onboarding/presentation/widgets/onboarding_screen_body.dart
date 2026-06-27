import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/features/onboarding/model/onboarding_model.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/boarding_item.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/onboarding_actions_section.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  final List<OnboardingModel> onboardingList = const [
    OnboardingModel(
      image: AppImages.onboarding1Image,
      title: AppStrings.onboarding1Title,
      body: AppStrings.onboarding1Body,
    ),
    OnboardingModel(
      image: AppImages.onboarding2Image,
      title: AppStrings.onboarding2Title,
      body: AppStrings.onboarding2Body,
    ),
    OnboardingModel(
      image: AppImages.onboarding3Image,
      title: AppStrings.onboarding3Title,
      body: AppStrings.onboarding3Body,
    ),
  ];

  PageController boardingController = PageController();
  bool isLast = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardingController,
              onPageChanged: (index) {
                if (index == onboardingList.length - 1) {
                  isLast = true;
                } else {
                  isLast = false;
                }
                if (index == 0) {
                  isFirst = true;
                } else {
                  isFirst = false;
                }
                setState(() {});
              },
              itemBuilder: (context, index) =>
                  BoardingItem(onboardingModel: onboardingList[index]),
              itemCount: onboardingList.length,
            ),
          ),
          const SizedBox(height: 40),
          OnboardingActionsSection(
            isFirst: isFirst,
            isLast: isLast,
            onboardingLength: onboardingList.length,
            boardingController: boardingController,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
