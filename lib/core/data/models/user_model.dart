import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    String? phone,
    String? profileImage,
    @Default(0.0) double referralBalance,
    String? referralCode,
    String? referredBy,
    VehicleModel? vehicle,
    @Default(0) int tripsBalance,
    @Default(4.5) double rating,
    @Default(0) int totalTrips,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

enum UserRole {
  @JsonValue('passenger')
  passenger,
  @JsonValue('driver')
  driver,
}

@freezed
class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    required String model,
    required String plate,
    required String color,
    String? year,
    String? image,
    @Default(true) bool isActive,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}