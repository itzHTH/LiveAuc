import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

class FirebaseAppCheckInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await FirebaseAppCheck.instance.getToken();

    if (token != null) {
      options.headers['X-Firebase-AppCheck'] = token;
    }

    super.onRequest(options, handler);
  }
}
