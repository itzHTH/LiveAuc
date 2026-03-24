// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestBody _$ResetPasswordRequestBodyFromJson(
  Map<String, dynamic> json,
) => ResetPasswordRequestBody(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestBodyToJson(
  ResetPasswordRequestBody instance,
) => <String, dynamic>{
  'email': instance.email,
  'newPassword': instance.newPassword,
  'token': instance.token,
};
