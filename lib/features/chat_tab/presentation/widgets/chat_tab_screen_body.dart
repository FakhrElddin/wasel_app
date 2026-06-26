import 'package:flutter/material.dart';

class ChatTabScreenBody extends StatelessWidget {
  const ChatTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Chat Tab Screen',
          ),
        ),
      ],
    );
  }
}
