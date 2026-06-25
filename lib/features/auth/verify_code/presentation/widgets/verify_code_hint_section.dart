import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class VerifyCodeHintSection extends StatelessWidget {
  const VerifyCodeHintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.enter6DigitCodeString, style: AppStyles.bold24Text),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.enter6DigitCodeBodyString,
          style: AppStyles.regular16Text,
        ),
      ],
    );
  }
}
