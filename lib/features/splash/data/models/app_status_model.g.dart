// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppStatusModel _$AppStatusModelFromJson(Map<String, dynamic> json) =>
    AppStatusModel(
      isMaintenance: json['isMaintenance'] as bool,
      updateRequired: json['updateRequired'] as bool,
      isBanned: json['isBanned'] as bool,
      message: json['message'] as String,
      storeUrl: json['storeUrl'] as String?,
    );

Map<String, dynamic> _$AppStatusModelToJson(AppStatusModel instance) =>
    <String, dynamic>{
      'isMaintenance': instance.isMaintenance,
      'updateRequired': instance.updateRequired,
      'isBanned': instance.isBanned,
      'message': instance.message,
      'storeUrl': instance.storeUrl,
    };
