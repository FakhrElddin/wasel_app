import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.redColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.redColor.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: Text(
          error,
          style: AppStyles.regular16Text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
