import 'package:flutter/material.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/add_book_screen_body.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddBookScreenBody(),
    );
  }
}
