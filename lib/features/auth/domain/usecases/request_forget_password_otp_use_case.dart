import 'package:street_auction/core/networking/api_results.dart';
import 'package:street_auction/core/usecase/base_use_case.dart';
import 'package:street_auction/features/auth/domain/entities/otp.dart';
import 'package:street_auction/features/auth/domain/entities/request_email_otp.dart';
import 'package:street_auction/features/auth/domain/repo/base_auth_repo.dart';

class RequestForgetPasswordOtpUseCase
    implements BaseUseCase<ApiResults<Otp>, RequestEmailOtp> {
  final BaseAuthRepo _baseAuthRepo;

  RequestForgetPasswordOtpUseCase(this._baseAuthRepo);

  @override
  Future<ApiResults<Otp>> call(RequestEmailOtp params) async {
    return await _baseAuthRepo.requestForgetPasswordOtp(params);
  }
}
