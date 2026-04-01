import 'package:dio/dio.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';

class MaintenanceInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 503) {
      AppNavigation.pushNamedAndRemoveUntil(
        AppRoutes.maintenance,
        arguments: err.response?.data['data']['message'],
        predicate: (route) => false,
      );
      return;
    }
    super.onError(err, handler);
  }
}
