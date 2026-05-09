import 'package:latlong2/latlong.dart';
import '../models/trip_model.dart';
import '../services/trip_service.dart';

class TripRepository {
  final TripService _tripService;

  TripRepository(this._tripService);

  Future<TripModel> createTrip({
    required LatLng pickupLocation,
    required LatLng dropoffLocation,
    required String pickupAddress,
    required String dropoffAddress,
    double? proposedPrice,
    String? notes,
    int passengerCount = 1,
  }) async {
    return await _tripService.createTrip(
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
      pickupAddress: pickupAddress,
      dropoffAddress: dropoffAddress,
      proposedPrice: proposedPrice,
      notes: notes,
      passengerCount: passengerCount,
    );
  }

  Future<List<TripModel>> getTrips({
    TripStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    return await _tripService.getTrips(
      status: status,
      page: page,
      limit: limit,
    );
  }

  Future<TripModel> getTrip(String tripId) async {
    return await _tripService.getTrip(tripId);
  }

  Future<TripModel> acceptTrip(String tripId) async {
    return await _tripService.acceptTrip(tripId);
  }

  Future<TripModel> startTrip(String tripId) async {
    return await _tripService.startTrip(tripId);
  }

  Future<TripModel> completeTrip(String tripId, double finalPrice) async {
    return await _tripService.completeTrip(tripId, finalPrice);
  }

  Future<TripModel> cancelTrip(String tripId, String reason) async {
    return await _tripService.cancelTrip(tripId, reason);
  }

  Future<List<TripModel>> getAvailableTrips() async {
    return await _tripService.getAvailableTrips();
  }

  Future<Map<String, dynamic>> getTripPricing({
    required LatLng pickup,
    required LatLng dropoff,
  }) async {
    return await _tripService.getTripPricing(
      pickup: pickup,
      dropoff: dropoff,
    );
  }
}