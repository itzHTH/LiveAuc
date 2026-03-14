import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/theme/app_color.dart';

class AppTextStyles {
  static TextStyle? font20BlackMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.uiBlack,
  );

  static TextStyle? font24BlackMedium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.uiBlack,
  );

  static TextStyle? font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.uiGray,
  );

  static TextStyle? font18WhiteMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.uiWhite,
  );
}
