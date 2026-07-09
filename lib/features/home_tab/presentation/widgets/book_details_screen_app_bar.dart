import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class BookDetailsScreenAppBar extends StatelessWidget {
  const BookDetailsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      centerTitle: true,
      surfaceTintColor: AppColors.transparentColor,
      actionsPadding: EdgeInsetsDirectional.only(end: AppConstants.appPadding),
      title: Text(
        AppStrings.bookDetailsString,
        style: AppStyles.bold18Text.copyWith(color: AppColors.blackColor),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.greyColor.withValues(alpha: 0.8),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: AppColors.whiteColor,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }
}
