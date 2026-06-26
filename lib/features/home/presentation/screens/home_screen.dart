import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/features/home/presentation/manager/home_cubit.dart';
import 'package:wasel_app/features/home/presentation/manager/home_states.dart';
import 'package:wasel_app/features/home/presentation/widgets/cusotm_bottom_nav_bar.dart';
import 'package:wasel_app/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          HomeCubit viewModel = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            bottomNavigationBar: CustomBottomNavBar(viewModel: viewModel),
            body: HomeScreenBody(tab: viewModel.tabs[viewModel.selectedIndex]),
          );
        },
      ),
    );
  }
}
