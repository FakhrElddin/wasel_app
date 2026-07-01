import 'package:flutter/material.dart';
import 'package:wasel_app/core/components/custom_text_button.dart';
import 'package:wasel_app/core/utils/app_constants.dart';
import 'package:wasel_app/core/utils/app_strings.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/add_book_details.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/add_book_screen_app_bar.dart';

class AddBookScreenBody extends StatelessWidget {
  const AddBookScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              AddBookScreenAppBar(),
              SliverToBoxAdapter(child: AddBookDetails()),
              SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 24.0,
            left: AppConstants.appPadding,
            right: AppConstants.appPadding,
          ),
          child: CustomTextButton(
            text: AppStrings.publishString,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
