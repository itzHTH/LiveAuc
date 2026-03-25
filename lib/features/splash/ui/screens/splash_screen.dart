import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleSplash();
  }

  Future<void> _handleSplash() async {
    // Wait for the minimum time to show the logo
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    await checkFirstTimeAndTokens();
  }

  /// Checks if the user is first time or not and navigates accordingly.
  Future<void> checkFirstTimeAndTokens() async {
    final bool? isFirstTime = await AppLocalCache.getBool(
      AppConstants.isFirstTimeKey,
    );

    if (!mounted) return;

    if (isFirstTime == true || isFirstTime == null) {
      context.pushNamedAndRemoveUntil(AppRoutes.onboarding);
    } else {
      await checkTokens();
    }
  }

  /// Checks if the user has valid tokens and navigates accordingly.
  Future<void> checkTokens() async {
    final String? token = await AppLocalCache.getSecuredString(
      AppConstants.tokenKey,
    );

    final String? refreshToken = await AppLocalCache.getSecuredString(
      AppConstants.refreshTokenKey,
    );

    if (!mounted) return;

    if (token != null && refreshToken != null) {
      context.pushNamedAndRemoveUntil(AppRoutes.home);
    } else {
      context.pushNamedAndRemoveUntil(AppRoutes.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.uiWhite,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.scale(
              scale: 0.6 + (value * 0.4), // Scale from 0.6 to 1.0
              child: Opacity(
                opacity: value.clamp(0.0, 1.0), // Fade from 0.0 to 1.0
                child: child,
              ),
            );
          },
          child: SvgPicture.asset(
            'assets/images/Logo.svg',
            width: 150.w,
            height: 150.h,
          ),
        ),
      ),
    );
  }
}
