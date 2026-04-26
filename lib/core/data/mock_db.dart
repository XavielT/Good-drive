import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MockDB {
  static const String _usersKey = 'mock_users';

  // Registrar nuevo usuario
  static Future<bool> register(String email, String password, String role) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> usersList = prefs.getStringList(_usersKey) ?? [];

    // Verificar si ya existe
    for (String userStr in usersList) {
      final user = jsonDecode(userStr);
      if (user['email'] == email) {
        return false; // Usuario ya existe
      }
    }

    final newUser = {
      'email': email,
      'password': password,
      'role': role,
      'tripsBalance': role == 'driver' ? 0 : null,
      'referralBalance': 0.0,
      'name': email.split('@')[0],
    };

    usersList.add(jsonEncode(newUser));
    await prefs.setStringList(_usersKey, usersList);
    
    // Iniciar sesión automáticamente
    await prefs.setBool('isLoggedIn', true);
    await prefs.setBool('isDriver', role == 'driver');
    await prefs.setString('currentUser', jsonEncode(newUser));
    return true;
  }

  // Iniciar Sesión
  static Future<Map<String, dynamic>?> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> usersList = prefs.getStringList(_usersKey) ?? [];

    for (String userStr in usersList) {
      final user = jsonDecode(userStr);
      if (user['email'] == email && user['password'] == password) {
        await prefs.setBool('isLoggedIn', true);
        await prefs.setBool('isDriver', user['role'] == 'driver');
        await prefs.setString('currentUser', userStr);
        return user;
      }
    }
    return null;
  }

  // Obtener usuario actual
  static Future<Map<String, dynamic>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('currentUser');
    if (userStr != null) {
      return jsonDecode(userStr);
    }
    return null;
  }

  // Actualizar usuario a conductor
  static Future<void> becomeDriver(Map<String, dynamic> vehicleData) async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('currentUser');
    if (userStr == null) return;

    Map<String, dynamic> user = jsonDecode(userStr);
    user['role'] = 'driver';
    user['tripsBalance'] = 0;
    user['vehicle'] = vehicleData;

    List<String> usersList = prefs.getStringList(_usersKey) ?? [];
    for (int i = 0; i < usersList.length; i++) {
      final u = jsonDecode(usersList[i]);
      if (u['email'] == user['email']) {
        usersList[i] = jsonEncode(user);
        break;
      }
    }

    await prefs.setStringList(_usersKey, usersList);
    await prefs.setString('currentUser', jsonEncode(user));
    await prefs.setBool('isDriver', true);
  }

  // Recargar viajes (Conductor)
  static Future<void> rechargeTrips(int trips) async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('currentUser');
    if (userStr == null) return;

    Map<String, dynamic> user = jsonDecode(userStr);
    if (user['role'] == 'driver') {
      user['tripsBalance'] = (user['tripsBalance'] ?? 0) + trips;

      List<String> usersList = prefs.getStringList(_usersKey) ?? [];
      for (int i = 0; i < usersList.length; i++) {
        final u = jsonDecode(usersList[i]);
        if (u['email'] == user['email']) {
          usersList[i] = jsonEncode(user);
          break;
        }
      }

      await prefs.setStringList(_usersKey, usersList);
      await prefs.setString('currentUser', jsonEncode(user));
    }
  }

  // Completar Viaje (Conductor)
  static Future<bool> completeTrip(double tripPrice) async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('currentUser');
    if (userStr == null) return false;

    Map<String, dynamic> user = jsonDecode(userStr);
    if (user['role'] == 'driver') {
      int balance = user['tripsBalance'] ?? 0;
      if (balance <= 0) return false; // No trips left!

      user['tripsBalance'] = balance - 1;

      List<String> usersList = prefs.getStringList(_usersKey) ?? [];
      for (int i = 0; i < usersList.length; i++) {
        final u = jsonDecode(usersList[i]);
        if (u['email'] == user['email']) {
          usersList[i] = jsonEncode(user);
          break;
        }
      }

      await prefs.setStringList(_usersKey, usersList);
      await prefs.setString('currentUser', jsonEncode(user));
      return true;
    }
    return false;
  }

  // Solicitar Retiro (Cualquier Rol)
  static Future<bool> requestWithdraw(double amount) async {
    final prefs = await SharedPreferences.getInstance();
    final userStr = prefs.getString('currentUser');
    if (userStr == null) return false;

    Map<String, dynamic> user = jsonDecode(userStr);
    double balance = (user['referralBalance'] ?? 0.0).toDouble();
    if (balance < amount) return false; // Not enough balance

    user['referralBalance'] = balance - amount;

    List<String> usersList = prefs.getStringList(_usersKey) ?? [];
    for (int i = 0; i < usersList.length; i++) {
      final u = jsonDecode(usersList[i]);
      if (u['email'] == user['email']) {
        usersList[i] = jsonEncode(user);
        break;
      }
    }

    await prefs.setStringList(_usersKey, usersList);
    await prefs.setString('currentUser', jsonEncode(user));
    return true;
  }
}
