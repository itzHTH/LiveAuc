import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/helpers/navigation_extension.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_color.dart';
import 'package:street_auction/features/auth/ui/cubit/login/login_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            SizedBox(height: 20.h),
            SizedBox(
              width: 200.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.alertError,
                  foregroundColor: AppColor.uiWhite,
                ),
                onPressed: () async {
                  await context.read<LoginCubit>().logout();

                  if (!context.mounted) return;
                  context.pushNamedAndRemoveUntil(AppRoutes.auth);
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
