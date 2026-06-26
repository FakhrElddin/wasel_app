import 'package:flutter/material.dart';

class ProfileTabScreenBody extends StatelessWidget {
  const ProfileTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Profile Tab Screen',
          ),
        ),
      ],
    );
  }
}
