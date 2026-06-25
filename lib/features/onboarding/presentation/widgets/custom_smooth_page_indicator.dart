import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasel_app/core/utils/app_colors.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller, required this.count});

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: AppColors.primaryColor,
        dotHeight: 10,
        dotWidth: 10,
        expansionFactor: 3,
        spacing: 5,
      ),
    );
  }
}
