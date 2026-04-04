import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/splash/domain/entities/app_status.dart';

abstract class BaseAppStatusRepo {
  Future<ApiResults<AppStatus>> getAppStatus({CancelToken? cancelToken});
}
