import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_body.g.dart';

@JsonSerializable()
class ResetPasswordRequestBody {
  final String email;
  final String newPassword;
  final String token;

  ResetPasswordRequestBody({
    required this.email,
    required this.newPassword,
    required this.token,
  });

  factory ResetPasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestBodyToJson(this);
}
