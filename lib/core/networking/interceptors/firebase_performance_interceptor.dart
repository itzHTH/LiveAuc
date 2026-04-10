import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

class FirebasePerformanceInterceptor extends Interceptor {
  static const _metricKey = 'firebase_performance_metric';

  /// Maps Dio's HTTP method string to Firebase's [HttpMethod] enum.
  HttpMethod _mapHttpMethod(String method) {
    switch (method.toUpperCase()) {
      case 'GET':
        return HttpMethod.Get;
      case 'POST':
        return HttpMethod.Post;
      case 'PUT':
        return HttpMethod.Put;
      case 'PATCH':
        return HttpMethod.Patch;
      case 'DELETE':
        return HttpMethod.Delete;
      default:
        return HttpMethod.Get;
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final metric = FirebasePerformance.instance.newHttpMetric(
      options.uri.toString(),
      _mapHttpMethod(options.method),
    );

    // Set request payload size if available
    if (options.data != null) {
      metric.requestPayloadSize = options.data.toString().length;
    }

    await metric.start();

    // Store the metric in extras so we can access it in onResponse/onError (Stored Locally)
    options.extra[_metricKey] = metric;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Get the metric from the request options extra
    final metric = response.requestOptions.extra[_metricKey] as HttpMetric?;

    if (metric != null) {
      metric
        ..httpResponseCode = response.statusCode
        ..responseContentType = response.headers['content-type']?.first
        ..responsePayloadSize = response.data.toString().length;

      await metric.stop();
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Get the metric from the request options extra
    final metric = err.requestOptions.extra[_metricKey] as HttpMetric?;

    if (metric != null) {
      metric.httpResponseCode = err.response?.statusCode;
      metric.responsePayloadSize = err.response?.data.toString().length;
      await metric.stop();
    }

    super.onError(err, handler);
  }
}
