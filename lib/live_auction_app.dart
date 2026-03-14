import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/routing/app_router.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
import 'package:street_auction/core/theme/app_theme.dart';

class LiveAuctionApp extends StatelessWidget {
  const LiveAuctionApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Live Auction',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.onboarding,
        theme: AppTheme.lightTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
