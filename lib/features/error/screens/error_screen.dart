import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/core/widgets/app_snack_bar.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.screenBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Icon badge ────────────────────────────────────────
                const Spacer(flex: 2),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColor.alertError.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 48.r,
                    color: AppColor.alertError,
                  ),
                ),
                SizedBox(height: 24.h),

                // ── Headline ──────────────────────────────────────────
                Text(
                  'An error occurred',
                  style: AppTextStyles.font24BlackMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18.h),

                // ── Message ───────────────────────────────
                Text(
                  'We are sorry, an error occurred and the application stopped working.\nWe have sent an error report to the development team to work on solving it as soon as possible.',
                  style: AppTextStyles.font16GrayRegular,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                SizedBox(height: 32.h),

                // ── Buttons ───────────────────────────────
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.splash,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 52.h),
                    backgroundColor: AppColor.uiBlack,
                  ),
                  child: Text(
                    'Restart Application',
                    style: AppTextStyles.font18WhiteMedium,
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    AppSnackBar.showWarning(
                      context: context,
                      message: 'Soon we will add this feature',
                    );
                  },
                  child: Text(
                    'Contact Support',
                    style: AppTextStyles.font16BlackRegular?.copyWith(
                      color: AppColor.primary500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.primary500,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
