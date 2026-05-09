import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/user_model.dart';
import 'api_client.dart';

class AuthService {
  final Dio _dio = ApiClient().dio;

  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      final user = UserModel.fromJson(response.data['user']);
      final token = response.data['token'];

      return AuthResponse.success(user, token);
    } on DioException catch (e) {
      return AuthResponse.error(_handleError(e));
    }
  }

  Future<AuthResponse> register({
    required String email,
    required String password,
    required UserRole role,
    String? referralCode,
    String? name,
  }) async {
    try {
      final data = {
        'email': email,
        'password': password,
        'role': role.name,
        if (referralCode != null) 'referralCode': referralCode,
        if (name != null) 'name': name,
      };

      final response = await _dio.post('/auth/register', data: data);

      final user = UserModel.fromJson(response.data['user']);
      final token = response.data['token'];

      return AuthResponse.success(user, token);
    } on DioException catch (e) {
      return AuthResponse.error(_handleError(e));
    }
  }

  Future<AuthResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });

      final user = UserModel.fromJson(response.data['user']);
      final token = response.data['token'];

      return AuthResponse.success(user, token);
    } on DioException catch (e) {
      return AuthResponse.error(_handleError(e));
    }
  }

  Future<bool> logout() async {
    try {
      await _dio.post('/auth/logout');
      return true;
    } catch (e) {
      // Even if logout fails, we should clear local data
      return true;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _dio.get('/auth/me');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      return null;
    }
  }

  Future<UserModel> updateProfile(UserModel user) async {
    try {
      final response = await _dio.put('/auth/profile', data: user.toJson());
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<UserModel> becomeDriver(VehicleModel vehicle) async {
    try {
      final response = await _dio.post('/auth/become-driver', data: vehicle.toJson());
      return UserModel.fromJson(response.data);
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

class AuthResponse {
  final bool success;
  final UserModel? user;
  final String? token;
  final String? error;

  AuthResponse.success(this.user, this.token)
      : success = true,
        error = null;

  AuthResponse.error(this.error)
      : success = false,
        user = null,
        token = null;
}