import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_images.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: false,
      titleSpacing: AppConstants.appPadding,
      surfaceTintColor: AppColors.transparentColor,
      actionsPadding: EdgeInsetsDirectional.only(end: AppConstants.appPadding),
      title: Row(
        children: [
          Image.asset(AppImages.logoImage, height: 40, width: 40),
          SizedBox(width: 8),
          Text(
            AppStrings.waselStringCapital,
            style: AppStyles.bold18Text.copyWith(letterSpacing: 3),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: AppColors.primaryColor),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(color: AppColors.greyColor, height: 1),
      ),
    );
  }
}
