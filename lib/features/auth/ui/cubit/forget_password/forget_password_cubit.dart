import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/entities/reset_password_request.dart';
import 'package:street_auction/features/auth/domain/entities/verfiy_email_otp.dart';
import 'package:street_auction/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/request_forget_password_otp_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/verfiy_forget_password_otp_use_case.dart';

part 'forget_password_state.dart';
part 'forget_password_cubit.freezed.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this._requestOtpUseCase,
    this._verifyOtpUseCase,
    this._forgetPasswordUseCase,
  ) : super(const ForgetPasswordState.initial());

  final RequestForgetPasswordOtpUseCase _requestOtpUseCase;
  final VerifyForgetPasswordOtpUseCase _verifyOtpUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  /// Stores the token from OTP verification for state restoration
  String _verifyToken = '';

  Future<void> requestOtp(RequestEmailOtp params) async {
    emit(const ForgetPasswordState.loading());
    final result = await _requestOtpUseCase.call(params);
    if (_requestOtpUseCase.isCancelled) return;
    result.when(
      success: (_) => emit(const ForgetPasswordState.otpSent()),
      failure: (error) =>
          emit(ForgetPasswordState.error(error.apiErrorModel.message ?? '')),
    );
  }

  Future<void> verifyOtp(VerifyEmailOtp params) async {
    emit(const ForgetPasswordState.loading());
    final result = await _verifyOtpUseCase.call(params);
    if (_verifyOtpUseCase.isCancelled) return;
    result.when(
      success: (otp) {
        _verifyToken = otp.registerToken ?? '';
        emit(ForgetPasswordState.verifyOtpSuccess(_verifyToken));
      },
      failure: (error) =>
          emit(ForgetPasswordState.error(error.apiErrorModel.message ?? '')),
    );
  }

  Future<void> resetPassword(ResetPasswordRequest params) async {
    emit(const ForgetPasswordState.loading());
    final result = await _forgetPasswordUseCase.call(params);
    if (_forgetPasswordUseCase.isCancelled) return;
    result.when(
      success: (_) => emit(const ForgetPasswordState.resetSuccess()),
      failure: (error) =>
          emit(ForgetPasswordState.error(error.apiErrorModel.message ?? '')),
    );
  }

  /// Cancel OTP request — go back to initial
  void cancelRequestOtp() {
    _requestOtpUseCase.cancel();
    emit(const ForgetPasswordState.initial());
  }

  /// Cancel OTP verification — go back to otpSent
  void cancelVerifyOtp() {
    _verifyOtpUseCase.cancel();
    emit(const ForgetPasswordState.otpSent());
  }

  /// Cancel password reset — go back to verifyOtpSuccess
  void cancelResetPassword() {
    _forgetPasswordUseCase.cancel();
    emit(ForgetPasswordState.verifyOtpSuccess(_verifyToken));
  }

  @override
  Future<void> close() {
    _requestOtpUseCase.cancel();
    _verifyOtpUseCase.cancel();
    _forgetPasswordUseCase.cancel();
    return super.close();
  }
}
