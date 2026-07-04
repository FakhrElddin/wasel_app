import 'package:flutter/material.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_details_screen_app_bar.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BookDetailsScreenAppBar(),
      ],
    );
  }
}