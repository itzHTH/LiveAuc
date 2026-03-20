import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/networking/errors/error_handler.dart';
import 'package:street_auction/features/auth/data/models/login_models/login_requset_body.dart';
import 'package:street_auction/features/auth/data/models/otp_email_models/request_body_models/request_email_otp_body.dart';
import 'package:street_auction/features/auth/data/models/otp_email_models/request_body_models/verify_email_otp_body.dart';
import 'package:street_auction/features/auth/data/models/register_models/register_requset_body.dart';
import 'package:street_auction/features/auth/data/services/auth_api_service.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/entities/otp.dart';
import 'package:street_auction/features/auth/domain/entities/register_request.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/entities/verfiy_email_otp.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class AuthRepo implements BaseAuthRepo {
  final AuthApiService _authApiService;

  AuthRepo(this._authApiService);

  @override
  Future<ApiResults<Auth>> login(LoginRequest loginRequest) async {
    try {
      final body = LoginRequestBody(
        email: loginRequest.email,
        password: loginRequest.password,
      );
      final response = await _authApiService.login(body);

      // Save token and refresh token in local cache
      await AppLocalCache.setSecuredString(
        AppConstants.tokenKey,
        response.token ?? "",
      );
      await AppLocalCache.setSecuredString(
        AppConstants.refreshTokenKey,
        response.refreshToken ?? "",
      );

      return ApiResults<Auth>.success(response.toEntity());
    } catch (e) {
      return ApiResults<Auth>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResults<Auth>> register(RegisterRequest body) async {
    try {
      final requestBody = RegisterRequestBody(
        password: body.password,
        firstName: body.firstName,
        lastName: body.lastName,
        registerToken: body.registerToken,
      );
      final response = await _authApiService.register(requestBody);

      // Save token and refresh token in local cache
      await AppLocalCache.setSecuredString(
        AppConstants.tokenKey,
        response.token ?? "",
      );
      await AppLocalCache.setSecuredString(
        AppConstants.refreshTokenKey,
        response.refreshToken ?? "",
      );

      return ApiResults<Auth>.success(response.toEntity());
    } catch (e) {
      return ApiResults<Auth>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResults<Otp>> requestRegisterOtp(RequestEmailOtp body) async {
    try {
      final requestBody = RequestEmailOtpBody(email: body.email);

      final response = await _authApiService.requestRegisterOtp(requestBody);
      return ApiResults<Otp>.success(response.toEntity());
    } catch (e) {
      return ApiResults<Otp>.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResults<Otp>> verifyRegisterOtp(VerifyEmailOtp body) async {
    try {
      final requestBody = VerifyEmailOtpBody(email: body.email, otp: body.otp);
      final response = await _authApiService.verifyRegisterOtp(requestBody);
      return ApiResults<Otp>.success(response.toEntity());
    } catch (e) {
      return ApiResults<Otp>.failure(ErrorHandler.handle(e));
    }
  }
}
