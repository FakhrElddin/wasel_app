import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/features/home_tab/domain/entities/categories_response_entity.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_cubit.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/selected_and_unselected_category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});

  final List<CategoriesDataEntity> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppConstants.appPadding,
      ),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          HomeTabCubit.get(context).changeSelectedCategory(index: index);
        },
        child: SelectedAndUnselectedCategoryCard(
          category: categories.reversed.toList()[index],
          isSelected: HomeTabCubit.get(context).selectedCategory == index,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemCount: categories.length,
    );
  }
}
