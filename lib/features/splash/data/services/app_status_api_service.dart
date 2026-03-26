import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:street_auction/core/networking/api_constants.dart';
import 'package:street_auction/features/splash/data/models/app_status_model.dart';

part 'app_status_api_service.g.dart';

@RestApi()
abstract class AppStatusService {
  factory AppStatusService(Dio dio, {String? baseUrl}) =>
      _AppStatusService(dio, baseUrl: baseUrl);

  @GET(ApiConstants.appStatus)
  Future<AppStatusModel> getAppStatus(
    @Query('clientVersion') String clientVersion,
    @Query('os') String os,
  );
}
