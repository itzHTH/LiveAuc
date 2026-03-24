import 'package:flutter/material.dart';
import 'package:street_auction/core/di/dependency_injection.dart';
import 'package:street_auction/core/routing/app_router.dart';
import 'package:street_auction/live_auction_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencyInjection.setupGetIt();
  runApp(LiveAuctionApp(appRouter: AppRouter()));
}
