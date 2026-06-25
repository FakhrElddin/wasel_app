import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.haveAccountString,
          style: AppStyles.regular18Text.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.loginNowString,
            style: AppStyles.regular18Text,
          ),
        ),
      ],
    );
  }
}
