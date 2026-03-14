import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.screenBackground,
      textTheme: GoogleFonts.poppinsTextTheme(),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.uiBlack,
          foregroundColor: AppColor.uiWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: AppTextStyles.font18WhiteMedium,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          minimumSize: Size(double.infinity, 50.h),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.uiBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: const BorderSide(color: AppColor.uiBlack, width: 1),
          ),
          textStyle: AppTextStyles.font18WhiteMedium,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          minimumSize: Size(double.infinity, 50.h),
        ),
      ),
    );
  }
}
