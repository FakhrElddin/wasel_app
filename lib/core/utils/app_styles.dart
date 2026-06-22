import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasel_app/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold38Text = GoogleFonts.poppins(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    letterSpacing: 30,
    color: AppColors.primaryColor,
  );
  static TextStyle bold14Text = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}