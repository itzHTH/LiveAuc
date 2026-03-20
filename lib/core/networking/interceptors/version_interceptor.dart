import 'package:dio/dio.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/networking/api_constants.dart';

class VersionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["X-Api-Version"] = ApiConstants.apiVersion;
    options.headers["X-App-Version"] = AppConstants.appVersion;
    super.onRequest(options, handler);
  }
}
