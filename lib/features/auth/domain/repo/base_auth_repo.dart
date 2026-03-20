import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';

abstract class BaseAuthRepo {
  Future<ApiResults<Auth>> login(LoginRequest loginRequest);
}
