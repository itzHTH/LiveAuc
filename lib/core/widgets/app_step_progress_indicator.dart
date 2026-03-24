import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/theme/app_color.dart';

class AppStepProgressIndicator extends StatelessWidget {
  const AppStepProgressIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: List.generate(
        totalPages,
        (index) => Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: 2.h,
            decoration: BoxDecoration(
              color: currentPage >= index
                  ? AppColor.uiBlack
                  : AppColor.uiDisabledPageBar.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ),
      ),
    );
  }
}
