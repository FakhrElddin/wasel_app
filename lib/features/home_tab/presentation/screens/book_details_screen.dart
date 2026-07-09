import 'package:flutter/material.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_details_screen_body.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsScreenBody(),
    );
  }
}
