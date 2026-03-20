import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/networking/errors/error_handler.dart';
import 'package:street_auction/features/auth/data/models/auth_requset_body.dart';
import 'package:street_auction/features/auth/data/services/auth_api_service.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class AuthRepo implements BaseAuthRepo {
  final AuthApiService _authApiService;

  AuthRepo(this._authApiService);

  @override
  Future<ApiResults<Auth>> login(LoginRequest loginRequest) async {
    try {
      final body = LoginRequestBody(
        username: loginRequest.username,
        password: loginRequest.password,
      );
      final response = await _authApiService.login(body);
      return ApiResults<Auth>.success(response.toEntity());
    } catch (e) {
      return ApiResults<Auth>.failure(ErrorHandler.handle(e));
    }
  }
}

