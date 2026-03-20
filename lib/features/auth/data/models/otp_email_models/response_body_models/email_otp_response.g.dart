// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailOtpResponse _$EmailOtpResponseFromJson(Map<String, dynamic> json) =>
    EmailOtpResponse(
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String,
      registerToken: json['data'] as String?,
    );

Map<String, dynamic> _$EmailOtpResponseToJson(EmailOtpResponse instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.registerToken,
    };
