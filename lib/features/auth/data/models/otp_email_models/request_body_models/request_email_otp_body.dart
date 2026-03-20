import 'package:json_annotation/json_annotation.dart';

part 'request_email_otp_body.g.dart';

@JsonSerializable()
class RequestEmailOtpBody {
  final String email;

  RequestEmailOtpBody({required this.email});

  Map<String, dynamic> toJson() => _$RequestEmailOtpBodyToJson(this);

  factory RequestEmailOtpBody.fromJson(Map<String, dynamic> json) =>
      _$RequestEmailOtpBodyFromJson(json);
}
