import 'package:json_annotation/json_annotation.dart';

part 'register_requset_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String password;
  final String firstName;
  final String lastName;
  final String registerToken;

  RegisterRequestBody({
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.registerToken,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);
}
