import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:wasel_app/features/auth/register/presentation/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => getIt<RegisterCubit>(),
      child: Scaffold(
        body: RegisterScreenBody(),
      ),
    );
  }
}
