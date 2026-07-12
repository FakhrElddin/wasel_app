import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wasel_app/core/utils/app_colors.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image shimmer
          Shimmer.fromColors(
            baseColor: AppColors.greyColor.withValues(alpha: 0.5),
            highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // first title line
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                  highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
                  child: Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                // second title line
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                  highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
                  child: Container(
                    height: 14,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // price
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                  highlightColor: AppColors.greyColor.withValues(alpha: 0.1),
                  child: Container(
                    height: 16,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // seller
                Row(
                  children: [
                    // seller image
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withValues(alpha: 0.5),
                      highlightColor: AppColors.greyColor.withValues(
                        alpha: 0.1,
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.greyColor.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // seller name
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                        highlightColor: AppColors.greyColor.withValues(
                          alpha: 0.1,
                        ),
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
