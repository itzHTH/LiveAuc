import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:street_auction/core/theme/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.screenBackground,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
