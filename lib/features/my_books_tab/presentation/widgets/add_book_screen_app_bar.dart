import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class AddBookScreenAppBar extends StatelessWidget {
  const AddBookScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: AppColors.transparentColor,
      floating: true,
      pinned: false,
      snap: true,
      centerTitle: true,
      title: Text(
        'Add Book To Your Gallery',
        style: AppStyles.bold18Text.copyWith(
          color: AppColors.blackColor,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    );
  }
}
