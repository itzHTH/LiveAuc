import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/cancellable_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/login_request.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class LoginUseCase
    extends CancellableUseCase<ApiResults<Auth>, LoginRequest> {
  final BaseAuthRepo _baseAuthRepo;

  LoginUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Auth>> execute(
    LoginRequest params,
    CancelToken cancelToken,
  ) async {
    return await _baseAuthRepo.login(params, cancelToken: cancelToken);
  }
}
