import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAnAccountString,
          style: AppStyles.regular18Text.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.registerScreenRoute,
            );
          },
          child: Text(
            AppStrings.signupString,
            style: AppStyles.regular18Text,
          ),
        ),
      ],
    );
  }
}
