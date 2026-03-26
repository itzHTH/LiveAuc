import 'package:flutter/foundation.dart';

class AppConstants {
  static const String appName = 'Live Auction';
  static const String appVersion = '0.6.0';
  static const String appDescription = 'Live Auction App';

  // Local Cache Keys
  static const String tokenKey = 'token';
  static const String refreshTokenKey = 'refreshToken';
  static const String isFirstTimeKey = 'isFirstTime';

  static const bool isDebug = kDebugMode;
}
