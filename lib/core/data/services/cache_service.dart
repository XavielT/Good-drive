import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String _tripsKey = 'cached_trips';
  static const String _userKey = 'cached_user';

  static Future<void> cacheTrips(List<Map<String, dynamic>> trips) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tripsKey, jsonEncode(trips));
  }

  static Future<List<Map<String, dynamic>>> getCachedTrips() async {
    final prefs = await SharedPreferences.getInstance();
    final tripsJson = prefs.getString(_tripsKey);
    if (tripsJson != null) {
      final List<dynamic> trips = jsonDecode(tripsJson);
      return trips.cast<Map<String, dynamic>>();
    }
    return [];
  }

  static Future<void> cacheUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user));
  }

  static Future<Map<String, dynamic>?> getCachedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tripsKey);
    await prefs.remove(_userKey);
  }
}