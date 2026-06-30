import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/features/favorites_tab/presentation/widgets/favorite_books_grid_view.dart';
import 'package:wasel_app/features/favorites_tab/presentation/widgets/favorites_app_bar.dart';

class FavoritesTabScreenBody extends StatelessWidget {
  const FavoritesTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FavoritesAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
          sliver: FavoriteBooksGridView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        ),
      ],
    );
  }
}
