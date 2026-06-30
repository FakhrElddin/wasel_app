import 'package:flutter/material.dart';
import 'package:wasel_app/features/favorites_tab/presentation/widgets/favorite_book_card.dart';

class FavoriteBooksGridView extends StatelessWidget {
  const FavoriteBooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 350,
      ),
      itemBuilder: (context, index) => FavoriteBookCard(),
    );
  }
}
