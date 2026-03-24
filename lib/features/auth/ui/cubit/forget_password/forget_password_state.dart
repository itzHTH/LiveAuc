part of 'forget_password_cubit.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = FpLoading;
  const factory ForgetPasswordState.otpSent() = FpOtpSent;
  const factory ForgetPasswordState.verifyOtpSuccess(String resetToken) =
      FpVerifyOtpSuccess;
  const factory ForgetPasswordState.resetSuccess() = FpResetSuccess;
  const factory ForgetPasswordState.error(String error) = FpError;
}
