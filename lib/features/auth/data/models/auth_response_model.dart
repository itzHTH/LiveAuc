import 'package:json_annotation/json_annotation.dart';
import 'package:street_auction/features/auth/domain/entities/auth.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  bool? isAuthenticated;
  String? userName;
  String? email;
  List<String>? roles;
  String? token;
  String? expiresOn;
  String? refreshToken;
  String? refreshTokenExpiration;

  AuthResponseModel({
    this.isAuthenticated,
    this.userName,
    this.email,
    this.roles,
    this.token,
    this.expiresOn,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

  Auth toEntity() =>
      Auth(isAuthenticated: isAuthenticated, userName: userName, email: email);
}
