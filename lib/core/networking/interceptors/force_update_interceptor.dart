import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/networking/api_constants.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';

class ForceUpdateInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 426 || err.response?.statusCode == 403) {
      final dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {'Accept': 'application/json'},
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          enabled: AppConstants.isDebug,
        ),
      );

      /// To Get The Url Of The Latest Version Of The App
      try {
        final response = await dio.get(
          ApiConstants.appStatus,
          queryParameters: {
            'os': Platform.isAndroid ? 'android' : 'ios',
            'clientVersion': AppConstants.appVersion,
          },
        );

        AppNavigation.pushReplacementNamed(
          AppRoutes.forceUpdate,
          arguments: {
            'message': response.data['data']['message'] ?? '',
            'storeUrl': response.data['data']['storeUrl'] ?? '',
          },
        );
        return;
      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}
