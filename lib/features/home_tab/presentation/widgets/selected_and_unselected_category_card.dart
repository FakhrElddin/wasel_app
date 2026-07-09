import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/category_card_shimmer.dart';

class SelectedAndUnselectedCategoryCard extends StatelessWidget {
  const SelectedAndUnselectedCategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
  });

  final CategoriesDataEntity category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedCategoryCard(category: category)
        : UnSelectedCategoryCard(category: category);
  }
}

class SelectedCategoryCard extends StatelessWidget {
  const SelectedCategoryCard({super.key, required this.category});

  final CategoriesDataEntity category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 3),
            ),
            child: CachedNetworkImage(
              width: 180,
              height: 120,
              fit: BoxFit.cover,
              imageUrl: category.image!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CategoryCardShimmer(),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.blackColor.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(category.name!, style: AppStyles.regular24Text),
        ),
      ],
    );
  }
}

class UnSelectedCategoryCard extends StatelessWidget {
  const UnSelectedCategoryCard({super.key, required this.category});

  final CategoriesDataEntity category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.transparentColor, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 180,
              height: 120,
              fit: BoxFit.cover,
              imageUrl: category.image!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CategoryCardShimmer(),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.blackColor.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(category.name!, style: AppStyles.regular24Text),
        ),
      ],
    );
  }
}
