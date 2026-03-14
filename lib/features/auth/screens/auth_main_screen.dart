import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

class AuthMainScreen extends StatelessWidget {
  const AuthMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to', style: AppTextStyles.font24BlackMedium),
                SizedBox(height: 32.h),
                SvgPicture.asset('assets/images/Logo.svg'),
                SizedBox(height: 60.h),
                ElevatedButton(onPressed: () {}, child: const Text('Register')),
                SizedBox(height: 16.h),
                OutlinedButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.login);
                  },
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
