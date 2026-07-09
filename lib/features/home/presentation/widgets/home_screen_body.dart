import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.tab});

  final Widget tab;

  @override
  Widget build(BuildContext context) {
    return tab;
  }
}
