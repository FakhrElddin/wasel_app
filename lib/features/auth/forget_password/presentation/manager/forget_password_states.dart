import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/forget_password/domain/entities/forget_password_response_entity.dart';

abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  final ForgetPasswordResponseEntity response;

  ForgetPasswordSuccessState({required this.response});
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  final Failures failure;

  ForgetPasswordErrorState({required this.failure});
}

class ChangeAutoValidateModeState extends ForgetPasswordStates{}
