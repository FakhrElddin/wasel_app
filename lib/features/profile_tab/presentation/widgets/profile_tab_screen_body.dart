import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/profile_tab/presentation/widgets/profile_image.dart';

import 'profile_details_image.dart';

class ProfileTabScreenBody extends StatelessWidget {
  const ProfileTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ProfileImage(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.emailString,
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: 'user@gmail.com',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.fullNameString,
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: 'user name',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.cardIdString,
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: '30204314124124',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.cityRegionString,
              style: AppStyles.regular20Text,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileDetailsItem(
              text: 'Cairo',
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextButton(
              text: 'Update profile',
              onPressed: (){},
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextButton(
              text: 'Log Out',
              backgroundColor: AppColors.redColor,
              onPressed: (){},
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
