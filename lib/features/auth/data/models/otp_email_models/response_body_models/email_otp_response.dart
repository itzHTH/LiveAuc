import 'package:json_annotation/json_annotation.dart';

part "email_otp_response.g.dart";

@JsonSerializable()
class EmailOtpResponse {
  final bool succeeded;
  final String message;
  @JsonKey(name: "data")
  final String? registerToken;

  EmailOtpResponse({
    required this.succeeded,
    required this.message,
    required this.registerToken,
  });

  factory EmailOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmailOtpResponseToJson(this);
}
