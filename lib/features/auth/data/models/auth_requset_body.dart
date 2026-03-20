import 'package:json_annotation/json_annotation.dart';

part 'auth_requset_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String username;
  final String password;

  LoginRequestBody({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);
}
