import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/di/dependency_injection.dart';
import 'package:street_auction/core/routing/app_router.dart';
import 'package:street_auction/firebase_options.dart';
import 'package:street_auction/flavors/flavors_config.dart';
import 'package:street_auction/live_auction_app.dart';

void mainCommon({
  required Flavor flavor,
  required String appName,
  required String baseUrl,
}) async {
  FlavorConfig(flavor: flavor, appName: appName, baseUrl: baseUrl);
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencyInjection.setupGetIt();

  if (flavor == Flavor.production) {
    /// Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    /// Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// To Fix Fonts not showing on Release Mode
  await ScreenUtil.ensureScreenSize();

  runApp(LiveAuctionApp(appRouter: AppRouter()));
}
