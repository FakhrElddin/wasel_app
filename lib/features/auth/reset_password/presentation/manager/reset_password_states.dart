import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/reset_password/domain/entities/reset_password_response_entity.dart';

abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
  final ResetPasswordResponseEntity response;

  ResetPasswordSuccessState({required this.response});
}

class ResetPasswordErrorState extends ResetPasswordStates {
  final Failures failure;

  ResetPasswordErrorState({required this.failure});
}

class ChangeVisibilityState extends ResetPasswordStates {}

class ChangeAutoValidateModeState extends ResetPasswordStates {}
