import 'package:json_annotation/json_annotation.dart';
import 'package:street_auction/features/auth/domain/entities/forget_passwrd.dart';

part 'forget_pasword_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  final bool succeeded;

  ForgetPasswordResponse({required this.succeeded});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);

  ForgetPassword toEntity() {
    return ForgetPassword(success: succeeded);
  }
}
