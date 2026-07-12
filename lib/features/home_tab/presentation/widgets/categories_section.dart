import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_cubit.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_states.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/categories_list_view.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/category_card_shimmer_list_view.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_error_widget.dart';

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
          SizedBox(
            height: 120,
            child: BlocBuilder<HomeTabCubit, HomeTabStates>(
              buildWhen: (previous, current) {
                return current is GetCategoriesSuccessState ||
                    current is GetCategoriesFailureState ||
                    current is GetCategoriesLoadingState;
              },
              builder: (context, state) {
                var viewModel = HomeTabCubit.get(context);
                if (viewModel.categoriesResponse != null) {
                  return CategoriesListView(
                    categories: viewModel.categoriesResponse!.data!,
                  );
                } else if (state is GetCategoriesFailureState) {
                  return CustomErrorWidget(
                    error: state.failure.errorMessage,
                  );
                } else {
                  return CategoryCardShimmerListView();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
