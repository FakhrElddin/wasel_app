import 'package:flutter/material.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_app_bar.dart';

class HomeTabScreenBody extends StatelessWidget {
  const HomeTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
      ],
    );
  }
}
