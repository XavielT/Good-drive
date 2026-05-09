part of 'trip_bloc.dart';

abstract class TripEvent extends Equatable {
  const TripEvent();

  @override
  List<Object?> get props => [];
}

class TripCreateRequested extends TripEvent {
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;
  final double? proposedPrice;
  final String? notes;
  final int passengerCount;

  const TripCreateRequested({
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
    this.proposedPrice,
    this.notes,
    this.passengerCount = 1,
  });

  @override
  List<Object?> get props => [
        pickupLocation,
        dropoffLocation,
        pickupAddress,
        dropoffAddress,
        proposedPrice,
        notes,
        passengerCount,
      ];
}

class TripListRequested extends TripEvent {
  final TripStatus? status;
  final int page;
  final int limit;

  const TripListRequested({
    this.status,
    this.page = 1,
    this.limit = 20,
  });

  @override
  List<Object?> get props => [status, page, limit];
}

class TripDetailsRequested extends TripEvent {
  final String tripId;

  const TripDetailsRequested(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

class TripAcceptRequested extends TripEvent {
  final String tripId;

  const TripAcceptRequested(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

class TripStartRequested extends TripEvent {
  final String tripId;

  const TripStartRequested(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

class TripCompleteRequested extends TripEvent {
  final String tripId;
  final double finalPrice;

  const TripCompleteRequested(this.tripId, this.finalPrice);

  @override
  List<Object?> get props => [tripId, finalPrice];
}

class TripCancelRequested extends TripEvent {
  final String tripId;
  final String reason;

  const TripCancelRequested(this.tripId, this.reason);

  @override
  List<Object?> get props => [tripId, reason];
}

class TripAvailableRequested extends TripEvent {}

class TripPricingRequested extends TripEvent {
  final LatLng pickup;
  final LatLng dropoff;

  const TripPricingRequested(this.pickup, this.dropoff);

  @override
  List<Object?> get props => [pickup, dropoff];
}