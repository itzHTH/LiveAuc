import 'package:dio/dio.dart';
import 'package:street_auction/core/helpers/app_navigation.dart';
import 'package:street_auction/core/routing/app_routes_name.dart';

class ForceUpdateInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 426) {
      AppNavigation.pushNamedAndRemoveUntil(
        AppRoutes.forceUpdate,
        arguments: err.response?.data['data']['storeUrl'],
        predicate: (route) => false,
      );
    }
    super.onError(err, handler);
  }
}
