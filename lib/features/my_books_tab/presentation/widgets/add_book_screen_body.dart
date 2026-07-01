import 'package:flutter/material.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/add_book_screen_app_bar.dart';

class AddBookScreenBody extends StatelessWidget {
  const AddBookScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AddBookScreenAppBar(),
      ],
    );
  }
}
