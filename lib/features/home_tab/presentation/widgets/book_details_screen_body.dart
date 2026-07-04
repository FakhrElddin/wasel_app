import 'package:flutter/material.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_details_screen_app_bar.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/book_gallery_section.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BookDetailsScreenAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: BookGallerySection(),
        ),
      ],
    );
  }
}