import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:wasel_app/features/auth/forget_password/presentation/widgets/forget_password_screen_body.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        body: ForgetPasswordScreenBody(),
      ),
    );
  }
}
