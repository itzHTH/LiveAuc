import 'package:json_annotation/json_annotation.dart';

part 'logout_request_body.g.dart';

@JsonSerializable()
class LogoutRequestBody {
  final String token;

  LogoutRequestBody({required this.token});

  Map<String, dynamic> toJson() => _$LogoutRequestBodyToJson(this);

  factory LogoutRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestBodyFromJson(json);
}
