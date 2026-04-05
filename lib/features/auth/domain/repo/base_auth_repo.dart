import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/forget_passwrd.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/entities/register_request.dart';
import 'package:street_auction/features/auth/domain/entities/otp.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/entities/reset_password_request.dart';
import 'package:street_auction/features/auth/domain/entities/verfiy_email_otp.dart';

abstract class BaseAuthRepo {
  Future<ApiResults<Auth>> login(LoginRequest loginRequest, {CancelToken? cancelToken});
  Future<ApiResults<Otp>> requestRegisterOtp(RequestEmailOtp body, {CancelToken? cancelToken});
  Future<ApiResults<Otp>> verifyRegisterOtp(VerifyEmailOtp body, {CancelToken? cancelToken});
  Future<ApiResults<Auth>> register(RegisterRequest body, {CancelToken? cancelToken});
  Future<ApiResults<Otp>> requestForgetPasswordOtp(RequestEmailOtp body, {CancelToken? cancelToken});
  Future<ApiResults<Otp>> verifyForgetPasswordOtp(VerifyEmailOtp body, {CancelToken? cancelToken});
  Future<ApiResults<ForgetPassword>> forgetPassword(ResetPasswordRequest body, {CancelToken? cancelToken});
  Future<ApiResults<void>> logout({CancelToken? cancelToken});
}
