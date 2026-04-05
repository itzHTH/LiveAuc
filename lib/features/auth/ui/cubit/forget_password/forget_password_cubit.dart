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

  /// Stores the state before loading — used by cancelCurrentRequest()
  ForgetPasswordState _previousState = const ForgetPasswordState.initial();

  Future<void> requestOtp(RequestEmailOtp params) async {
    _previousState = state;
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
    _previousState = state;
    emit(const ForgetPasswordState.loading());
    final result = await _verifyOtpUseCase.call(params);
    if (_verifyOtpUseCase.isCancelled) return;
    result.when(
      success: (otp) => emit(
        ForgetPasswordState.verifyOtpSuccess(otp.registerToken ?? ''),
      ),
      failure: (error) =>
          emit(ForgetPasswordState.error(error.apiErrorModel.message ?? '')),
    );
  }

  Future<void> resetPassword(ResetPasswordRequest params) async {
    _previousState = state;
    emit(const ForgetPasswordState.loading());
    final result = await _forgetPasswordUseCase.call(params);
    if (_forgetPasswordUseCase.isCancelled) return;
    result.when(
      success: (_) => emit(const ForgetPasswordState.resetSuccess()),
      failure: (error) =>
          emit(ForgetPasswordState.error(error.apiErrorModel.message ?? '')),
    );
  }

  /// Cancel whatever is currently in-flight — restores previous state
  void cancelCurrentRequest() {
    _requestOtpUseCase.cancel();
    _verifyOtpUseCase.cancel();
    _forgetPasswordUseCase.cancel();
    emit(_previousState);
  }

  @override
  Future<void> close() {
    _requestOtpUseCase.cancel();
    _verifyOtpUseCase.cancel();
    _forgetPasswordUseCase.cancel();
    return super.close();
  }
}
