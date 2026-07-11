import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/features/home_tab/domain/entities/books_response_entity.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_card.dart';

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key, required this.books});

  final List<BooksDataEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: books.length,
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
        child: BookCard(
          book: books[index],
        ),
      ),
    );
  }
}
