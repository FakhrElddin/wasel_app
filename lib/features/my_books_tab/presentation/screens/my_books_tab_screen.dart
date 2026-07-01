import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/features/my_books_tab/presentation/widgets/my_books_tab_screen_body.dart';

class MyBooksTabScreen extends StatelessWidget {
  const MyBooksTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addBookScreenRoute);
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
          size: 32,
        ),
      ),
      body: MyBooksTabScreenBody(),
    );
  }
}
