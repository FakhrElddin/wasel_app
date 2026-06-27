import 'package:flutter/material.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_app_bar.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/custom_carousel_slider.dart';

class HomeTabScreenBody extends StatelessWidget {
  const HomeTabScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16),
          sliver: SliverToBoxAdapter(
            child: CustomCarouselSlider(),
          ),
        ),
      ],
    );
  }
}
