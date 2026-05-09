import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/secure_storage.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<AuthResponse> login(String email, String password) async {
    final response = await _authService.login(email, password);

    if (response.success && response.token != null) {
      // Save tokens securely
      await SecureStorage.saveTokens(
        response.token!,
        response.token!, // In real app, get refresh token from response
      );
      if (response.user != null) {
        await SecureStorage.saveUserId(response.user!.id);
      }
    }

    return response;
  }

  Future<AuthResponse> register({
    required String email,
    required String password,
    required UserRole role,
    String? referralCode,
    String? name,
  }) async {
    final response = await _authService.register(
      email: email,
      password: password,
      role: role,
      referralCode: referralCode,
      name: name,
    );

    if (response.success && response.token != null) {
      await SecureStorage.saveTokens(
        response.token!,
        response.token!,
      );
      if (response.user != null) {
        await SecureStorage.saveUserId(response.user!.id);
      }
    }

    return response;
  }

  Future<bool> logout() async {
    final success = await _authService.logout();
    if (success) {
      await SecureStorage.clearAll();
    }
    return success;
  }

  Future<UserModel?> getCurrentUser() async {
    final hasTokens = await SecureStorage.hasTokens();
    if (!hasTokens) return null;

    return await _authService.getCurrentUser();
  }

  Future<bool> isAuthenticated() async {
    return await SecureStorage.hasTokens();
  }

  Future<UserModel> updateProfile(UserModel user) async {
    return await _authService.updateProfile(user);
  }

  Future<UserModel> becomeDriver(VehicleModel vehicle) async {
    return await _authService.becomeDriver(vehicle);
  }
}