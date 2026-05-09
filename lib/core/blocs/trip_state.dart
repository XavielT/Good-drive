part of 'trip_bloc.dart';

abstract class TripState extends Equatable {
  const TripState();

  @override
  List<Object?> get props => [];
}

class TripInitial extends TripState {}

class TripLoading extends TripState {}

class TripCreated extends TripState {
  final TripModel trip;

  const TripCreated(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripListLoaded extends TripState {
  final List<TripModel> trips;

  const TripListLoaded(this.trips);

  @override
  List<Object?> get props => [trips];
}

class TripDetailsLoaded extends TripState {
  final TripModel trip;

  const TripDetailsLoaded(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripAccepted extends TripState {
  final TripModel trip;

  const TripAccepted(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripStarted extends TripState {
  final TripModel trip;

  const TripStarted(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripCompleted extends TripState {
  final TripModel trip;

  const TripCompleted(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripCancelled extends TripState {
  final TripModel trip;

  const TripCancelled(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripAvailableLoaded extends TripState {
  final List<TripModel> trips;

  const TripAvailableLoaded(this.trips);

  @override
  List<Object?> get props => [trips];
}

class TripPricingLoaded extends TripState {
  final Map<String, dynamic> pricing;

  const TripPricingLoaded(this.pricing);

  @override
  List<Object?> get props => [pricing];
}

class TripError extends TripState {
  final String message;

  const TripError(this.message);

  @override
  List<Object?> get props => [message];
}