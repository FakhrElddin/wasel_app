import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class ResetPasswordHintSection extends StatelessWidget {
  const ResetPasswordHintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.resetPasswordString, style: AppStyles.bold24Text),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.resetPasswordBodyString,
          style: AppStyles.regular16Text,
        ),
      ],
    );
  }
}
