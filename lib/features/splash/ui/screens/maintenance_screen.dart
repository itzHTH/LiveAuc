import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key, required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Cannot leave — app is under maintenance
      child: Scaffold(
        backgroundColor: AppColor.screenBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Icon badge ────────────────────────────────────────
                const Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColor.alertInfo.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.build_rounded,
                    size: 48.r,
                    color: AppColor.alertInfo,
                  ),
                ),
                SizedBox(height: 24.h),

                // ── Headline ──────────────────────────────────────────
                Text(
                  'Under Maintenance',
                  style: AppTextStyles.font24BlackMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),

                // ── Message from backend ───────────────────────────────
                Text(
                  message ??
                      'We are currently performing scheduled maintenance. '
                          'Please check back shortly.',
                  style: AppTextStyles.font16GrayRegular,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),
                SizedBox(height: 32.h),
                ElevatedButton(
                  onPressed: () => exit(0),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 52.h),
                    backgroundColor: AppColor.alertInfo,
                  ),
                  child: Text(
                    'Close App',
                    style: AppTextStyles.font18WhiteMedium,
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
