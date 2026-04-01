import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:street_auction/core/networking/api_constants.dart';
import 'package:street_auction/features/auth/data/models/forget_passwoed_models/request_models/forget_password_request_body.dart';
import 'package:street_auction/features/auth/data/models/forget_passwoed_models/response_models/forget_pasword_response.dart';
import 'package:street_auction/features/auth/data/models/login_models/login_requset_body.dart';
import 'package:street_auction/features/auth/data/models/auth_response_model.dart';
import 'package:street_auction/features/auth/data/models/otp_email_models/request_body_models/request_email_otp_body.dart';
import 'package:street_auction/features/auth/data/models/otp_email_models/request_body_models/verify_email_otp_body.dart';
import 'package:street_auction/features/auth/data/models/otp_email_models/response_body_models/email_otp_response.dart';
import 'package:street_auction/features/auth/data/models/logout_models/logout_request_body.dart';
import 'package:street_auction/features/auth/data/models/register_models/register_requset_body.dart';
part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() LoginRequestBody body);

  @POST(ApiConstants.requestRegisterOtp)
  Future<EmailOtpResponse> requestRegisterOtp(@Body() RequestEmailOtpBody body);

  @POST(ApiConstants.verifyRegisterOtp)
  Future<EmailOtpResponse> verifyRegisterOtp(@Body() VerifyEmailOtpBody body);

  @POST(ApiConstants.register)
  Future<AuthResponseModel> register(@Body() RegisterRequestBody body);

  @POST(ApiConstants.requestForgetPasswordOtp)
  Future<EmailOtpResponse> requestForgetPasswordOtp(
    @Body() RequestEmailOtpBody body,
  );

  @POST(ApiConstants.verifyForgetPasswordOtp)
  Future<EmailOtpResponse> verifyForgetPasswordOtp(
    @Body() VerifyEmailOtpBody body,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ResetPasswordRequestBody body,
  );

  @POST(ApiConstants.logout)
  Future<void> logout(@Body() LogoutRequestBody body);
}
