import 'package:flutter/material.dart';
import 'passenger_home_screen.dart';
import 'pilot_home_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isPilotMode;

  const HomeScreen({super.key, required this.isPilotMode});

  @override
  Widget build(BuildContext context) {
    if (isPilotMode) {
      return const PilotHomeScreen();
    } else {
      return const PassengerHomeScreen();
    }
  }
}