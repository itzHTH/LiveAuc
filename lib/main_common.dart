import 'package:flutter/material.dart';
import 'package:street_auction/core/di/dependency_injection.dart';
import 'package:street_auction/core/routing/app_router.dart';
import 'package:street_auction/flavors/flavors_config.dart';
import 'package:street_auction/live_auction_app.dart';

void mainCommon({
  required Flavor flavor,
  required String appName,
  required String baseUrl,
}) {
  FlavorConfig(flavor: flavor, appName: appName, baseUrl: baseUrl);
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencyInjection.setupGetIt();
  runApp(LiveAuctionApp(appRouter: AppRouter()));
}
