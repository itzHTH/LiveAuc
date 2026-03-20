import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:street_auction/core/networking/api_constants.dart';
import 'package:street_auction/features/auth/data/models/auth_requset_body.dart';
import 'package:street_auction/features/auth/data/models/auth_response_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() LoginRequestBody body);
}
