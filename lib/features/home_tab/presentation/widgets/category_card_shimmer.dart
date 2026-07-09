import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wasel_app/core/utils/app_colors.dart';

class CategoryCardShimmer extends StatelessWidget {
  const CategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withValues(alpha: 0.3,),
      highlightColor: AppColors.greyColor.withValues(alpha: 0.1,),
      child: Container(
        width: 180,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}