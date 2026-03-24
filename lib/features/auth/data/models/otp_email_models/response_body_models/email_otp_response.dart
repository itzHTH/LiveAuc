import 'package:json_annotation/json_annotation.dart';
import 'package:street_auction/features/auth/domain/entities/otp.dart';

part "email_otp_response.g.dart";

@JsonSerializable()
class EmailOtpResponse {
  final bool succeeded;
  final String message;
  @JsonKey(name: "data")
  final dynamic registerToken;

  EmailOtpResponse({
    required this.succeeded,
    required this.message,
    required this.registerToken,
  });

  factory EmailOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmailOtpResponseToJson(this);

  Otp toEntity() {
    return Otp(
      registerToken: registerToken,
      succeeded: succeeded,
      message: message,
    );
  }
}
