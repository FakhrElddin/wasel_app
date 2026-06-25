import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:wasel_app/features/auth/login/presentation/manager/login_states.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());
  LoginUseCase loginUseCase;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        email: emailController.text,
        password: passwordController.text,
      );
      either.fold(
        (failure) => emit(LoginErrorState(failure: failure)),
        (response) => emit(LoginSuccessState(response: response)),
      );
    } else {
      changeAutoValidateMode();
    }
  }

  void changeVisibility({required bool isPassword}) {
    this.isPassword = isPassword;
    emit(ChangeVisibilityState());
  }

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateModeState());
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
    emit(LoginInitialState());
  }
}
