import 'package:flutter/material.dart';

class MyBooksTabScreenBody extends StatelessWidget {
  const MyBooksTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'My Books Tab Screen',
          ),
        ),
      ],
    );
  }
}
