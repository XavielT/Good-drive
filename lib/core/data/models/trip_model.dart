import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
class TripModel with _$TripModel {
  const factory TripModel({
    required String id,
    required String passengerId,
    String? driverId,
    required LatLng pickupLocation,
    required LatLng dropoffLocation,
    required String pickupAddress,
    required String dropoffAddress,
    @Default(TripStatus.pending) TripStatus status,
    double? price,
    double? distance,
    int? duration,
    PaymentMethod? paymentMethod,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? createdAt,
    String? notes,
    @Default(1) int passengerCount,
    List<String>? waypoints,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}

enum TripStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum PaymentMethod {
  @JsonValue('cash')
  cash,
  @JsonValue('card')
  card,
  @JsonValue('wallet')
  wallet,
}