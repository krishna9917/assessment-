import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme() => TextTheme(
    titleLarge: GoogleFonts.publicSans(
      fontSize: 18.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.publicSans(
      fontSize: 16.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.publicSans(
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
      color: AppColors.black,
    ),
    bodyMedium: GoogleFonts.publicSans(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.black,
    ),
    bodySmall: GoogleFonts.publicSans(
      fontWeight: FontWeight.w600,
      fontSize: 12.sp,
      color: AppColors.grey_1000,
    ),
  );
}
