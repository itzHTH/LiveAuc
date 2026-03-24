import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/register_request.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/entities/verfiy_email_otp.dart';
import 'package:street_auction/features/auth/domain/usecases/register_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/request_email_otp_use_case.dart';
import 'package:street_auction/features/auth/domain/usecases/verfiy_email_otp_use_case.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this._requestEmailOtpUseCase,
    this._verifyEmailOtpUseCase,
    this._registerUseCase,
  ) : super(const RegisterState.initial());

  final RequestEmailOtpUseCase _requestEmailOtpUseCase;
  final VerifyEmailOtpUseCase _verifyEmailOtpUseCase;
  final RegisterUseCase _registerUseCase;

  Future<void> requestEmailOtp(RequestEmailOtp params) async {
    emit(const RegisterState.loading());
    final result = await _requestEmailOtpUseCase.call(params);
    result.when(
      success: (data) {
        emit(const RegisterState.otpSent());
      },
      failure: (error) {
        emit(RegisterState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> verifyEmailOtp(VerifyEmailOtp params) async {
    emit(const RegisterState.loading());
    final result = await _verifyEmailOtpUseCase.call(params);
    result.when(
      success: (data) {
        emit(RegisterState.verifyOtpSuccess(data.registerToken ?? ""));
      },
      failure: (error) {
        emit(RegisterState.error(error.apiErrorModel.message ?? ""));
      },
    );
  }

  Future<void> register(RegisterRequest params) async {
    emit(const RegisterState.loading());
    final result = await _registerUseCase.call(params);
    result.when(
      success: (data) {
        emit(RegisterState.registerSuccess(data));
      },
      failure: (error) {
        emit(RegisterState.error(error.apiErrorModel.message ?? ""));
      },
    );
  }
}
