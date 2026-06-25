import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wasel_app/features/auth/reset_password/domain/use_cases/reset_password_use_case.dart';
import 'package:wasel_app/features/auth/reset_password/presentation/manager/reset_password_states.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit({required this.resetPasswordUseCase})
    : super(ResetPasswordInitialState());
  ResetPasswordUseCase resetPasswordUseCase;

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool firstIsPassword = true;
  bool secondIsPassword = true;

  void resetPassword({required String email, required String resetCode}) async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState());
      var either = await resetPasswordUseCase.invoke(
        email: email,
        resetCode: resetCode,
        newPassword: newPasswordController.text,
      );
      either.fold(
        (failure) => emit(ResetPasswordErrorState(failure: failure)),
        (response) => emit(ResetPasswordSuccessState(response: response)),
      );
    } else {
      changeAutoValidateMode();
    }
  }

  void changeVisibility({
    required bool isFirstField,
    required bool isPassword,
  }) {
    if (isFirstField) {
      firstIsPassword = isPassword;
    }
    if (isFirstField == false) {
      secondIsPassword = isPassword;
    }
    emit(ChangeVisibilityState());
  }

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateModeState());
  }
}
