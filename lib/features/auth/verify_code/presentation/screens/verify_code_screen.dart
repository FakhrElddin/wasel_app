import 'package:flutter/material.dart';
import 'package:wasel_app/features/auth/verify_code/presentation/widgets/verify_code_screen_body.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyCodeScreenBody(),
    );
  }
}
