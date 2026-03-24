// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      isAuthenticated: json['isAuthenticated'] as bool?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      token: json['token'] as String?,
      expiresOn: json['expiresOn'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiration: json['refreshTokenExpiration'] as String?,
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'isAuthenticated': instance.isAuthenticated,
      'userName': instance.userName,
      'email': instance.email,
      'roles': instance.roles,
      'token': instance.token,
      'expiresOn': instance.expiresOn,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiration': instance.refreshTokenExpiration,
    };
