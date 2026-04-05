import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/cancellable_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/forget_passwrd.dart';
import 'package:street_auction/features/auth/domain/entities/reset_password_request.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class ForgetPasswordUseCase
    extends CancellableUseCase<ApiResults<ForgetPassword>, ResetPasswordRequest> {
  final BaseAuthRepo _baseAuthRepo;

  ForgetPasswordUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<ForgetPassword>> execute(
    ResetPasswordRequest params,
    CancelToken cancelToken,
  ) async {
    return await _baseAuthRepo.forgetPassword(
      params,
      cancelToken: cancelToken,
    );
  }
}
