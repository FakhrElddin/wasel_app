import 'package:flutter/material.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/my_books_card.dart';

class MyBooksGridView extends StatelessWidget {
  const MyBooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 320,
      ),
      itemBuilder: (context, index) => MyBooksCard(),
    );
  }
}
