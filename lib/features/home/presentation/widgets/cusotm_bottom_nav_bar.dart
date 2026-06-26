import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/features/home/presentation/manager/home_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.viewModel});

  final HomeCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.greyColor)),
      ),
      child: NavigationBar(
        backgroundColor: AppColors.whiteColor,
        indicatorColor: AppColors.primaryColor,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        animationDuration: Duration(milliseconds: 1000),
        selectedIndex: viewModel.selectedIndex,
        onDestinationSelected: (index) {
          viewModel.changeSelectedTab(index: index);
        },
        destinations: viewModel.items,
      ),
    );
  }
}
