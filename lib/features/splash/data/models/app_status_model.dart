import 'package:json_annotation/json_annotation.dart';
import 'package:street_auction/features/splash/domain/entities/app_status.dart';

part 'app_status_model.g.dart';

@JsonSerializable()
class AppStatusModel extends AppStatus {
  AppStatusModel({
    required super.isMaintenance,
    required super.updateRequired,
    required super.isBanned,
    required super.message,
    required super.storeUrl,
  });

  factory AppStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AppStatusModelFromJson(json['data']);

  Map<String, dynamic> toJson() => _$AppStatusModelToJson(this);

  AppStatus toEntity() {
    return AppStatus(
      isMaintenance: isMaintenance,
      updateRequired: updateRequired,
      isBanned: isBanned,
      message: message,
      storeUrl: storeUrl,
    );
  }
}
