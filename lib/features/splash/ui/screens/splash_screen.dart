import 'package:flutter/material.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/features/splash/ui/widgets/animated_logo.dart';
import 'package:street_auction/features/splash/ui/widgets/animated_status_message.dart';

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
    await Future.delayed(const Duration(seconds: 7));
    if (!mounted) return;
    await _checkFirstTimeAndTokens();
  }

  Future<void> _checkFirstTimeAndTokens() async {
    final bool? isFirstTime = await AppLocalCache.getBool(
      AppConstants.isFirstTimeKey,
    );
    if (!mounted) return;

    if (isFirstTime == true || isFirstTime == null) {
      context.pushNamedAndRemoveUntil(AppRoutes.onboarding);
    } else {
      await _checkTokens();
    }
  }

  Future<void> _checkTokens() async {
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
    return const Scaffold(
      backgroundColor: AppColor.uiWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(flex: 3),
            AnimatedLogo(),
            Spacer(flex: 2),
            AnimatedStatusMessage(),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
