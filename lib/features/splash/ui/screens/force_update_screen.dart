import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_url_launcher.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key, required this.storeUrl});

  final String storeUrl;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // User cannot dismiss — update is mandatory
      child: Scaffold(
        backgroundColor: AppColor.screenBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ── Warning badge ─────────────────────────────────────
                const Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColor.alertWarning.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.system_update_rounded,
                    size: 48.r,
                    color: AppColor.alertWarning,
                  ),
                ),
                SizedBox(height: 24.h),

                // ── Headline ──────────────────────────────────────────
                Text(
                  'Update Required',
                  style: AppTextStyles.font24BlackMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),

                // ── Description ───────────────────────────────────────
                Text(
                  'Your current version (${AppConstants.appVersion}) is no longer supported. '
                  'Please update the app to the latest version to continue.',
                  style: AppTextStyles.font16GrayRegular,
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 1),

                // ── Update button ─────────────────────────────────────
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () => AppUrlLauncher.launch(storeUrl),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 52.h),
                      backgroundColor: AppColor.primary700,
                    ),
                    child: Text(
                      'Update Now',
                      style: AppTextStyles.font18WhiteMedium,
                    ),
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
