import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class HintSection extends StatelessWidget {
  const HintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.forgetPasswordString, style: AppStyles.bold24Text),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.forgetPasswordBodyString,
          style: AppStyles.regular16Text,
        ),
      ],
    );
  }
}
