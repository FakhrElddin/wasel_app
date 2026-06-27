import 'package:flutter/material.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_card.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key});

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
      itemBuilder: (context, index) => BookCard(),
    );
  }
}
