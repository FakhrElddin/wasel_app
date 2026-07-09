import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/category_card_shimmer.dart';

class CategoryCardShimmerListView extends StatelessWidget {
  const CategoryCardShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppConstants.appPadding,
      ),
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CategoryCardShimmer(),
      separatorBuilder: (context, index) =>
      const SizedBox(width: 16),
      itemCount: 4,
    );
  }
}
