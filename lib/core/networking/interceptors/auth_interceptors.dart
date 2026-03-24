import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/networking/api_constants.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ${AppLocalCache.getSecuredString(AppConstants.tokenKey)}';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // if the refresh token is got an error (refresh token is expired) => logout
      if (err.requestOptions.path.contains(ApiConstants.refreshToken)) {
        await AppLocalCache.clearAllSecuredData();
        AppNavigation.pushReplacementNamed(AppRoutes.login);
        return handler.next(err);
      }

      try {
        final String? refreshToken = await AppLocalCache.getSecuredString(
          AppConstants.refreshTokenKey,
        );

        // create a new dio instance to avoid infinite loop
        final Dio tokenDio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        );

        tokenDio.interceptors.add(
          PrettyDioLogger(
            enabled: kDebugMode,
            requestBody: true,
            responseBody: true,
            error: true,
            request: true,
            requestHeader: true,
            responseHeader: true,
          ),
        );

        final Response response = await tokenDio.post(
          ApiConstants.refreshToken,
          data: {"token": refreshToken},
        );

        if (response.statusCode == 200) {
          final String newAccessToken =
              response.data["data"][AppConstants.tokenKey];
          final String newRefreshToken =
              response.data["data"][AppConstants.refreshTokenKey];
          await AppLocalCache.setSecuredString(
            AppConstants.tokenKey,
            newAccessToken,
          );
          await AppLocalCache.setSecuredString(
            AppConstants.refreshTokenKey,
            newRefreshToken,
          );

          // clone request options to edit the headers
          final opts = err.requestOptions;
          opts.headers["Authorization"] = "Bearer $newAccessToken";

          // retry the request with the new access token (skip the error interceptor)
          return handler.resolve(await tokenDio.fetch(opts));
        }

        return handler.next(err);
      } catch (e) {
        return handler.next(err);
      }
    }
    super.onError(err, handler);
  }
}
