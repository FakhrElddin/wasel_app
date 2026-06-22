import 'package:flutter/material.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/widgets/reset_password_screen_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResetPasswordScreenBody(),
    );
  }
}
