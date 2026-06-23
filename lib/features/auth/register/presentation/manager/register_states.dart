import 'package:wasel_app/core/errors/failures.dart';
import 'package:wasel_app/features/auth/register/domain/entities/register_response_entity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterResponseEntity registerResponse;

  RegisterSuccessState({required this.registerResponse});
}

class RegisterErrorState extends RegisterStates {
  final Failures failure;

  RegisterErrorState({required this.failure});
}

class ChangeVisibilityState extends RegisterStates {}

class ChangeAutoValidateModeState extends RegisterStates {}

