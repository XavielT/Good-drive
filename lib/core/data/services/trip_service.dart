import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import '../models/trip_model.dart';
import 'api_client.dart';

class TripService {
  final Dio _dio = ApiClient().dio;

  Future<TripModel> createTrip({
    required LatLng pickupLocation,
    required LatLng dropoffLocation,
    required String pickupAddress,
    required String dropoffAddress,
    double? proposedPrice,
    String? notes,
    int passengerCount = 1,
  }) async {
    try {
      final response = await _dio.post('/trips', data: {
        'pickupLocation': {
          'lat': pickupLocation.latitude,
          'lng': pickupLocation.longitude,
        },
        'dropoffLocation': {
          'lat': dropoffLocation.latitude,
          'lng': dropoffLocation.longitude,
        },
        'pickupAddress': pickupAddress,
        'dropoffAddress': dropoffAddress,
        'proposedPrice': proposedPrice,
        'notes': notes,
        'passengerCount': passengerCount,
      });

      return TripModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<TripModel>> getTrips({
    TripStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      if (status != null) {
        params['status'] = status.name;
      }

      final response = await _dio.get('/trips', queryParameters: params);

      final trips = (response.data['trips'] as List)
          .map((json) => TripModel.fromJson(json))
          .toList();

      return trips;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<TripModel> getTrip(String tripId) async {
    try {
      final response = await _dio.get('/trips/$tripId');
      return TripModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<TripModel> acceptTrip(String tripId) async {
    try {
      final response = await _dio.post('/trips/$tripId/accept');
      return TripModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<TripModel> startTrip(String tripId) async {
    try {
      final response = await _dio.post('/trips/$tripId/start');
      return TripModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<TripModel> completeTrip(String tripId, double finalPrice) async {
    try {
      final response = await _dio.post('/trips/$tripId/complete', data: {
        'finalPrice': finalPrice,
      });
      return TripModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<TripModel> cancelTrip(String tripId, String reason) async {
    try {
      final response = await _dio.post('/trips/$tripId/cancel', data: {
        'reason': reason,
      });
      return TripModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<TripModel>> getAvailableTrips() async {
    try {
      final response = await _dio.get('/trips/available');
      final trips = (response.data as List)
          .map((json) => TripModel.fromJson(json))
          .toList();
      return trips;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> getTripPricing({
    required LatLng pickup,
    required LatLng dropoff,
  }) async {
    try {
      final response = await _dio.post('/trips/pricing', data: {
        'pickup': {'lat': pickup.latitude, 'lng': pickup.longitude},
        'dropoff': {'lat': dropoff.latitude, 'lng': dropoff.longitude},
      });

      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    if (e.response?.data != null && e.response?.data is Map) {
      final data = e.response!.data as Map<String, dynamic>;
      return data['message'] ?? 'An error occurred';
    }
    return e.message ?? 'Network error';
  }
}