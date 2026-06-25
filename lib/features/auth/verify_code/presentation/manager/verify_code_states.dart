import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/verify_code/domain/entities/verify_code_response_entity.dart';

abstract class VerifyCodeStates {}

class VerifyCodeInitialState extends VerifyCodeStates {}

class VerifyCodeLoadingState extends VerifyCodeStates {}

class VerifyCodeSuccessState extends VerifyCodeStates {
  final VerifyCodeResponseEntity response;

  VerifyCodeSuccessState({required this.response});
}

class VerifyCodeErrorState extends VerifyCodeStates {
  final Failures failure;

  VerifyCodeErrorState({required this.failure});
}

class ChangeAutoValidateModeState extends VerifyCodeStates{}
