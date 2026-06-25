import 'package:flutter/material.dart';
import 'package:wasel_app/core/utils/app_colors.dart';

class BottomSheetUtils {
  static void showBottomSheet({
    required BuildContext context,
    required Widget widget,
  }){
    showModalBottomSheet(
      context: context,
      builder: (context) => widget,
      backgroundColor: AppColors.whiteColor,
      isScrollControlled: true,
    );
  }
}