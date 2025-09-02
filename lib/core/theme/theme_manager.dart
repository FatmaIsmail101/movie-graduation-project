import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theme/color_pallete.dart';

abstract class AppThemeManager {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: ColorPallete.scaffoldBackgroundColor,
    primaryColor: ColorPallete.scaffoldBackgroundColor,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      bodySmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
        color: Colors.black,
      ),
      headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: Colors.white,
      ),
    ),
    hintColor: Colors.grey,
    highlightColor: Colors.white,
  );
}
