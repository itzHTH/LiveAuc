/// Centralized analytics event names to avoid typos and ensure consistency.
/// Use these constants whenever logging events instead of raw strings.
class AnalyticsEvents {
  // Auth Events
  static const String loginSuccess = 'login_success';
  static const String loginFailed = 'login_failed';
  static const String signUpSuccess = 'sign_up_success';
  static const String signUpFailed = 'sign_up_failed';
  static const String logoutSuccess = 'logout_success';
  static const String forgotPassword = 'forgot_password';
  static const String resetPasswordSuccess = 'reset_password_success';

  // OTP Events
  static const String forgetPasswordOtpRequested =
      'forget_password_otp_requested';
  static const String forgetPasswordOtpVerified =
      'forget_password_otp_verified';
  static const String forgetPasswordOtpFailed = 'forget_password_otp_failed';
  static const String registerOtpRequested = 'register_otp_requested';
  static const String registerOtpVerified = 'register_otp_verified';
  static const String registerOtpFailed = 'register_otp_failed';

  // App Update Events
  static const String appUpdateAvailable = 'app_update_available';
  static const String appUpdateSkipped = 'app_update_skipped';
  static const String appUpdateForce = 'app_update_force';
  static const String appUpdateBanned = 'app_update_banned';
  static const String appMaintenance = 'app_maintenance';

  // General Events
  static const String appOpened = 'app_opened';
  static const String onboardingCompleted = 'onboarding_completed';
}
