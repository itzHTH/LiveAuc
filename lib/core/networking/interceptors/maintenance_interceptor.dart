import 'package:dio/dio.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';

class MaintenanceInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 503) {
      AppNavigation.pushNamedAndRemoveUntil(
        AppRoutes.maintenance,
        predicate: (route) => false,
      );
    }
    super.onError(err, handler);
  }
}
