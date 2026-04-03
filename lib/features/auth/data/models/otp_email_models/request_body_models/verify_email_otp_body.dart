import 'package:json_annotation/json_annotation.dart';

part 'verify_email_otp_body.g.dart';

@JsonSerializable()
class VerifyEmailOtpBody {
  final String email;
  final int? otp;

  VerifyEmailOtpBody({required this.email, required this.otp});

  Map<String, dynamic> toJson() => _$VerifyEmailOtpBodyToJson(this);

  factory VerifyEmailOtpBody.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpBodyFromJson(json);
}
