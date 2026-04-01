import 'package:street_auction/flavors/flavors_config.dart';

class ApiConstants {
  static String get baseUrl => FlavorConfig.instance.baseUrl;
  static const String apiVersion = '1.0';
  static const String acceptEncoding = 'br';

  // App Status
  static const String appStatus = '/liveauction/AppStatus/check';

  // Auth
  static const String login = '/liveauction/Auth/login';
  static const String requestRegisterOtp =
      '/liveauction/Auth/request-register-otp';
  static const String verifyRegisterOtp =
      '/liveauction/Auth/verify-register-otp';
  static const String register = '/liveauction/Auth/register';
  static const String requestForgetPasswordOtp =
      '/liveauction/Auth/forgot-password-otp';
  static const String verifyForgetPasswordOtp =
      '/liveauction/Auth/verify-password-otp';
  static const String forgetPassword = '/liveauction/Auth/reset-password';
  static const String refreshToken = '/liveauction/Auth/refresh-token';
  static const String logout = '/liveauction/Auth/logout';

  //
}
