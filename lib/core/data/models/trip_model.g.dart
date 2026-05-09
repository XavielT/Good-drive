// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripModelImpl _$$TripModelImplFromJson(Map<String, dynamic> json) =>
    _$TripModelImpl(
      id: json['id'] as String,
      passengerId: json['passengerId'] as String,
      driverId: json['driverId'] as String?,
      pickupLocation: LatLng.fromJson(
        json['pickupLocation'] as Map<String, dynamic>,
      ),
      dropoffLocation: LatLng.fromJson(
        json['dropoffLocation'] as Map<String, dynamic>,
      ),
      pickupAddress: json['pickupAddress'] as String,
      dropoffAddress: json['dropoffAddress'] as String,
      status:
          $enumDecodeNullable(_$TripStatusEnumMap, json['status']) ??
          TripStatus.pending,
      price: (json['price'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toInt(),
      paymentMethod: $enumDecodeNullable(
        _$PaymentMethodEnumMap,
        json['paymentMethod'],
      ),
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
      passengerCount: (json['passengerCount'] as num?)?.toInt() ?? 1,
      waypoints: (json['waypoints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$TripModelImplToJson(_$TripModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'passengerId': instance.passengerId,
      'driverId': instance.driverId,
      'pickupLocation': instance.pickupLocation,
      'dropoffLocation': instance.dropoffLocation,
      'pickupAddress': instance.pickupAddress,
      'dropoffAddress': instance.dropoffAddress,
      'status': _$TripStatusEnumMap[instance.status]!,
      'price': instance.price,
      'distance': instance.distance,
      'duration': instance.duration,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod],
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'notes': instance.notes,
      'passengerCount': instance.passengerCount,
      'waypoints': instance.waypoints,
    };

const _$TripStatusEnumMap = {
  TripStatus.pending: 'pending',
  TripStatus.accepted: 'accepted',
  TripStatus.inProgress: 'in_progress',
  TripStatus.completed: 'completed',
  TripStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.card: 'card',
  PaymentMethod.wallet: 'wallet',
};
