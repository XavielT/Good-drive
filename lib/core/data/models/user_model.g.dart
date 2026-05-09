// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      phone: json['phone'] as String?,
      profileImage: json['profileImage'] as String?,
      referralBalance: (json['referralBalance'] as num?)?.toDouble() ?? 0.0,
      referralCode: json['referralCode'] as String?,
      referredBy: json['referredBy'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      tripsBalance: (json['tripsBalance'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
      totalTrips: (json['totalTrips'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phone': instance.phone,
      'profileImage': instance.profileImage,
      'referralBalance': instance.referralBalance,
      'referralCode': instance.referralCode,
      'referredBy': instance.referredBy,
      'vehicle': instance.vehicle,
      'tripsBalance': instance.tripsBalance,
      'rating': instance.rating,
      'totalTrips': instance.totalTrips,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.passenger: 'passenger',
  UserRole.driver: 'driver',
};

_$VehicleModelImpl _$$VehicleModelImplFromJson(Map<String, dynamic> json) =>
    _$VehicleModelImpl(
      model: json['model'] as String,
      plate: json['plate'] as String,
      color: json['color'] as String,
      year: json['year'] as String?,
      image: json['image'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$VehicleModelImplToJson(_$VehicleModelImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'plate': instance.plate,
      'color': instance.color,
      'year': instance.year,
      'image': instance.image,
      'isActive': instance.isActive,
    };
