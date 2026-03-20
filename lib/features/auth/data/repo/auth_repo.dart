import 'package:street_auction/core/const/app_constants.dart';
import 'package:street_auction/core/helpers/app_local_cache.dart';
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
        email: loginRequest.email,
        password: loginRequest.password,
      );
      final response = await _authApiService.login(body);

      // Save token and refresh token in local cache
      await AppLocalCache.setSecuredString(
        AppConstants.tokenKey,
        response.token ?? "",
      );
      await AppLocalCache.setSecuredString(
        AppConstants.refreshTokenKey,
        response.refreshToken ?? "",
      );

      return ApiResults<Auth>.success(response.toEntity());
    } catch (e) {
      return ApiResults<Auth>.failure(ErrorHandler.handle(e));
    }
  }
}
