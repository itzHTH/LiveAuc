import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

class AppBottomSheet {
  /// Shows a generic bottom sheet with a title, body widget, and action buttons.
  ///
  /// Returns `true` if the primary action was tapped, `false` otherwise.
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required Widget body,
    required String primaryLabel,
    required VoidCallback onPrimary,
    String? secondaryLabel,
    VoidCallback? onSecondary,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: AppColor.elementBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => _AppBottomSheetContent(
        title: title,
        body: body,
        primaryLabel: primaryLabel,
        onPrimary: onPrimary,
        secondaryLabel: secondaryLabel,
        onSecondary: onSecondary,
      ),
    );
  }
}

class _AppBottomSheetContent extends StatelessWidget {
  const _AppBottomSheetContent({
    required this.title,
    required this.body,
    required this.primaryLabel,
    required this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
  });

  final String title;
  final Widget body;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColor.uiDisabled,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Title
            Text(title, style: AppTextStyles.font20BlackMedium),
            SizedBox(height: 12.h),

            // Body content
            body,
            SizedBox(height: 24.h),

            // Primary button
            ElevatedButton(
              onPressed: onPrimary,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary700,
                minimumSize: Size(double.infinity, 52.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
              child: Text(
                primaryLabel,
                style: AppTextStyles.font16WhiteMedium,
                textAlign: TextAlign.center,
              ),
            ),

            // Secondary button (optional)
            if (secondaryLabel != null) ...[
              SizedBox(height: 12.h),
              OutlinedButton(
                onPressed: onSecondary,
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 52.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  side: const BorderSide(color: AppColor.uiGray),
                ),
                child: Text(
                  secondaryLabel!,
                  style: AppTextStyles.font16WhiteMedium?.copyWith(
                    color: AppColor.uiGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
