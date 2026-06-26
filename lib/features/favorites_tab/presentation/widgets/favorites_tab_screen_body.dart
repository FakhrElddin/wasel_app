import 'package:flutter/material.dart';

class FavoritesTabScreenBody extends StatelessWidget {
  const FavoritesTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Favorites Tab Screen',
          ),
        ),
      ],
    );
  }
}
