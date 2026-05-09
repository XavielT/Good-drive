import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  static Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged.map((results) => results.first);

  static Future<ConnectivityResult> get currentConnectivity async {
    final results = await _connectivity.checkConnectivity();
    return results.first;
  }

  static Future<bool> get isConnected async {
    final result = await currentConnectivity;
    return result != ConnectivityResult.none;
  }
}