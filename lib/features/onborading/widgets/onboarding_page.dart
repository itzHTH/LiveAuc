import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';
import 'package:street_auction/features/onborading/models/page_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.pages});

  final PageModel pages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(pages.image, height: 300.h),
        SizedBox(height: 40.h),
        Text(
          pages.title,
          style: AppTextStyles.font20BlackMedium,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        SizedBox(height: 12.h),
        Text(
          pages.description,
          textAlign: TextAlign.center,
          style: AppTextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
