import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/manager/verify_code_cubit.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/widgets/verify_code_screen_body.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyCodeCubit>(
      create: (context) => getIt<VerifyCodeCubit>(),
      child: Scaffold(
        body: VerifyCodeScreenBody(),
      ),
    );
  }
}
