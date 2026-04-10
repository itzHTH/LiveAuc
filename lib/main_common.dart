import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:street_auction/core/di/dependency_injection.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/routing/app_router.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';
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

    /// Initialize Firebase App Check
    await FirebaseAppCheck.instance.activate(
      providerAndroid: kDebugMode
          ? const AndroidDebugProvider()
          : const AndroidPlayIntegrityProvider(),
    );

    /// Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppNavigation.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.error,
          (route) => false,
        );
      });
    };

    /// Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppNavigation.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.error,
          (route) => false,
        );
      });

      return true;
    };
  }

  /// To Fix Fonts not showing on Release Mode
  await ScreenUtil.ensureScreenSize();

  runApp(LiveAuctionApp(appRouter: AppRouter()));
}
