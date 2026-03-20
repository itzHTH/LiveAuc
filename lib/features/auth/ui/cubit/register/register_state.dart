part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.otpSent() = OtpSent;
  const factory RegisterState.verifyOtpSuccess(String registerToken) =
      VerifyOtpSuccess;
  const factory RegisterState.registerSuccess(Auth auth) = RegisterSuccess;
  const factory RegisterState.error(String error) = Error;
}
