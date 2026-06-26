import 'package:flutter/material.dart';

class HomeTabScreenBody extends StatelessWidget {
  const HomeTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Home Tab Screen',
          ),
        ),
      ],
    );
  }
}
