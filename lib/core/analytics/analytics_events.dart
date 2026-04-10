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
  static const String otpRequested = 'otp_requested';
  static const String otpVerified = 'otp_verified';
  static const String otpFailed = 'otp_failed';

  // Auction Events
  static const String auctionViewed = 'auction_viewed';
  static const String auctionJoined = 'auction_joined';
  static const String bidPlaced = 'bid_placed';
  static const String auctionWon = 'auction_won';

  // General Events
  static const String appOpened = 'app_opened';
  static const String onboardingCompleted = 'onboarding_completed';
}
