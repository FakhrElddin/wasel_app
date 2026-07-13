import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/core/utils/app_styles.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_cubit.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_states.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_card_shimmer_grid_view.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/books_grid_view.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/categories_section.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_app_bar.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_carousel_slider.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_error_widget.dart';

class HomeTabScreenBody extends StatelessWidget {
  const HomeTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16),
          sliver: SliverToBoxAdapter(child: CustomCarouselSlider()),
        ),
        CategoriesSection(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: AppConstants.appPadding,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppStrings.booksString, style: AppStyles.bold20Text),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        BlocBuilder<HomeTabCubit, HomeTabStates>(
          buildWhen: (previous, current) {
            return current is GetBooksSuccessState ||
                current is GetBooksFailureState ||
                current is GetBooksLoadingState;
          },
          builder: (context, state) {
            if (state is GetBooksSuccessState) {
              return SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppConstants.appPadding,
                ),
                sliver: BooksGridView(books: state.responseEntity.data!),
              );
            } else if (state is GetBooksFailureState) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: CustomErrorWidget(error: state.failure.errorMessage),
              );
            } else {
              return SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppConstants.appPadding,
                ),
                sliver: BookCardShimmerGridView(),
              );
            }
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }
}
