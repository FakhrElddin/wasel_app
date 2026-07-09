import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_cubit.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_states.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/selected_and_unselected_category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: AppConstants.appPadding,
            ),
            child: Text(
              AppStrings.categoriesString,
              style: AppStyles.bold20Text,
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<HomeTabCubit, HomeTabStates>(
            builder: (context, state) {
              var viewModel = HomeTabCubit.get(context);
              if (viewModel.categoriesResponse != null) {
                return SizedBox(
                  height: 120,
                  child: ListView.separated(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.appPadding,
                    ),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        viewModel.changeSelectedCategory(index: index);
                      },
                      child: SelectedAndUnselectedCategoryCard(
                        category: viewModel.categoriesResponse!.data!.reversed.toList()[index],
                        isSelected: viewModel.selectedCategory == index,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemCount: viewModel.categoriesResponse!.data!.length,
                  ),
                );
              } else if (state is GetCategoriesFailureState) {
                return Center(child: Text(state.failure.errorMessage));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
