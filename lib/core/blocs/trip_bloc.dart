import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import '../data/models/trip_model.dart';
import '../data/repositories/trip_repository.dart';

part 'trip_event.dart';
part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository _tripRepository;

  TripBloc(this._tripRepository) : super(TripInitial()) {
    on<TripCreateRequested>(_onCreateRequested);
    on<TripListRequested>(_onListRequested);
    on<TripDetailsRequested>(_onDetailsRequested);
    on<TripAcceptRequested>(_onAcceptRequested);
    on<TripStartRequested>(_onStartRequested);
    on<TripCompleteRequested>(_onCompleteRequested);
    on<TripCancelRequested>(_onCancelRequested);
    on<TripAvailableRequested>(_onAvailableRequested);
    on<TripPricingRequested>(_onPricingRequested);
  }

  Future<void> _onCreateRequested(
    TripCreateRequested event,
    Emitter<TripState> emit,
  ) async {
    emit(TripLoading());

    try {
      final trip = await _tripRepository.createTrip(
        pickupLocation: event.pickupLocation,
        dropoffLocation: event.dropoffLocation,
        pickupAddress: event.pickupAddress,
        dropoffAddress: event.dropoffAddress,
        proposedPrice: event.proposedPrice,
        notes: event.notes,
        passengerCount: event.passengerCount,
      );

      emit(TripCreated(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onListRequested(
    TripListRequested event,
    Emitter<TripState> emit,
  ) async {
    emit(TripLoading());

    try {
      final trips = await _tripRepository.getTrips(
        status: event.status,
        page: event.page,
        limit: event.limit,
      );

      emit(TripListLoaded(trips));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onDetailsRequested(
    TripDetailsRequested event,
    Emitter<TripState> emit,
  ) async {
    emit(TripLoading());

    try {
      final trip = await _tripRepository.getTrip(event.tripId);
      emit(TripDetailsLoaded(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onAcceptRequested(
    TripAcceptRequested event,
    Emitter<TripState> emit,
  ) async {
    try {
      final trip = await _tripRepository.acceptTrip(event.tripId);
      emit(TripAccepted(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onStartRequested(
    TripStartRequested event,
    Emitter<TripState> emit,
  ) async {
    try {
      final trip = await _tripRepository.startTrip(event.tripId);
      emit(TripStarted(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onCompleteRequested(
    TripCompleteRequested event,
    Emitter<TripState> emit,
  ) async {
    try {
      final trip = await _tripRepository.completeTrip(event.tripId, event.finalPrice);
      emit(TripCompleted(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onCancelRequested(
    TripCancelRequested event,
    Emitter<TripState> emit,
  ) async {
    try {
      final trip = await _tripRepository.cancelTrip(event.tripId, event.reason);
      emit(TripCancelled(trip));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onAvailableRequested(
    TripAvailableRequested event,
    Emitter<TripState> emit,
  ) async {
    emit(TripLoading());

    try {
      final trips = await _tripRepository.getAvailableTrips();
      emit(TripAvailableLoaded(trips));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }

  Future<void> _onPricingRequested(
    TripPricingRequested event,
    Emitter<TripState> emit,
  ) async {
    try {
      final pricing = await _tripRepository.getTripPricing(
        pickup: event.pickup,
        dropoff: event.dropoff,
      );
      emit(TripPricingLoaded(pricing));
    } catch (e) {
      emit(TripError(e.toString()));
    }
  }
}