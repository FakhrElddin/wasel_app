import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/login/domain/entities/login_response_entity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginResponseEntity response;

  LoginSuccessState({required this.response});
}

class LoginErrorState extends LoginStates {
  final Failures failure;

  LoginErrorState({required this.failure});
}

class ChangeVisibilityState extends LoginStates{}

class ChangeAutoValidateModeState extends LoginStates{}
