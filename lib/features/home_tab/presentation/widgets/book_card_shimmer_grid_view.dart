import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_card_shimmer.dart';

class BookCardShimmerGridView extends StatelessWidget {
  const BookCardShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 350,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.bookDetailsScreenRoute);
        },
        child: BookCardShimmer(),
      ),
    );
  }
}
