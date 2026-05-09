import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:good_drive_app/main.dart';
import 'package:good_drive_app/core/data/repositories/auth_repository.dart';
import 'package:good_drive_app/core/data/repositories/trip_repository.dart';
import 'package:good_drive_app/core/data/services/auth_service.dart';
import 'package:good_drive_app/core/data/services/trip_service.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    // Create mock services
    final authService = AuthService();
    final tripService = TripService();
    final authRepository = AuthRepository(authService);
    final tripRepository = TripRepository(tripService);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      authRepository: authRepository,
      tripRepository: tripRepository,
    ));

    // Verify that the app builds
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
