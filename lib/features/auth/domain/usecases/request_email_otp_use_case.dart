import 'package:dio/dio.dart';
import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/cancellable_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/otp.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class RequestEmailOtpUseCase
    extends CancellableUseCase<ApiResults<Otp>, RequestEmailOtp> {
  final BaseAuthRepo _baseAuthRepo;

  RequestEmailOtpUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Otp>> execute(
    RequestEmailOtp params,
    CancelToken cancelToken,
  ) async {
    return await _baseAuthRepo.requestRegisterOtp(
      params,
      cancelToken: cancelToken,
    );
  }
}
