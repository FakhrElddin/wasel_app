import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/features/home_tab/presentation/manager/home_tab_cubit.dart';
import 'package:wasel_app/features/home_tab/presentation/widgets/home_tab_screen_body.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabCubit>(
      create: (context) => getIt<HomeTabCubit>()..getCategories(),
      child: HomeTabScreenBody(),
    );
  }
}
