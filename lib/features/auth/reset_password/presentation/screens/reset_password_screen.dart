import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_cubit.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/widgets/reset_password_screen_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        body: ResetPasswordScreenBody(),
      ),
    );
  }
}
