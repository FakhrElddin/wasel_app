import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_styles.dart';

class DialogUtils {
  static void showAwSomeDialog({
    required BuildContext context,
    required String title,
    required String description,
    void Function()? btnCancelOnPress,
    void Function()? btnOkOnPress,
    DialogType dialogType = DialogType.info,
    bool dismissOnTouchOutside = true,
    bool dismissOnBackKeyPress = true,
  }) {
    AwesomeDialog(
      context: context,
      dismissOnTouchOutside: dismissOnTouchOutside,
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      titleTextStyle: AppStyles.bold24Text,
      desc: description,
      descTextStyle: AppStyles.regular18Text.copyWith(
        color: AppColors.blackColor,
      ),
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
      btnOkColor: AppColors.primaryColor,
    ).show();
  }
}