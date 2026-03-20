class ApiConstants {
  static const String baseUrl = 'https://apiservice.ddns.net';
  static const String apiVersion = '1.0';
  static const String acceptEncoding = 'br';

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
}
