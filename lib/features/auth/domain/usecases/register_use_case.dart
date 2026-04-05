import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/cancellable_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';
import 'package:street_auction/features/auth/domain/entities/register_request.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class RegisterUseCase
    extends CancellableUseCase<ApiResults<Auth>, RegisterRequest> {
  final BaseAuthRepo _baseAuthRepo;

  RegisterUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Auth>> execute(
    RegisterRequest params,
    CancelToken cancelToken,
  ) async {
    return await _baseAuthRepo.register(params, cancelToken: cancelToken);
  }
}
