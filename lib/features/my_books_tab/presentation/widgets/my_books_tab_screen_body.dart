import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/my_books_app_bar.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/my_books_grid_view.dart';

class MyBooksTabScreenBody extends StatelessWidget {
  const MyBooksTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MyBooksAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.appPadding),
          sliver: MyBooksGridView(),
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
