import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logoImage, width: 180, height: 180),
        Text(AppStrings.waselStringCapital, style: AppStyles.bold38Text),
      ],
    );
  }
}
