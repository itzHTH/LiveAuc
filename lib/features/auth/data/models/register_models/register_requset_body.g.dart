// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_requset_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      registerToken: json['registerToken'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'password': instance.password,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'registerToken': instance.registerToken,
};
