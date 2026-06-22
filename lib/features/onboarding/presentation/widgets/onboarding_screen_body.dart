import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/features/onboarding/model/onboarding_model.dart';
import 'package:wasel_app/features/onboarding/presentation/widgets/boarding_item.dart';

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
              },
              itemBuilder: (context, index) =>
                  BoardingItem(onboardingModel: onboardingList[index]),
              itemCount: onboardingList.length,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: 'btn1',
                onPressed: () {
                  if (isFirst == false) {
                    boardingController.previousPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  } else {}
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                ),
              ),
              SmoothPageIndicator(
                controller: boardingController,
                count: onboardingList.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  spacing: 5,
                ),
              ),
              FloatingActionButton(
                heroTag: 'btn2',
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
                      context, AppRoutes.loginScreenRoute,
                    );
                  }
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
