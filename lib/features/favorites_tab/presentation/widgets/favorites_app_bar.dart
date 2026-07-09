import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class FavoritesAppBar extends StatelessWidget {
  const FavoritesAppBar({super.key});

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
          Text(
            AppStrings.myFavoritesString,
            style: AppStyles.bold24Text,
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(color: AppColors.greyColor, height: 1),
      ),
    );
  }
}

