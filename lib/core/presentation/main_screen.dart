import 'package:flutter/material.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/trips/presentation/trips_screen.dart';
import '../../features/wallet/presentation/wallet_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback onLogout;
  final bool isDriver;

  const MainScreen({super.key, required this.onLogout, required this.isDriver});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  bool _isPilotMode = false;

  @override
  void initState() {
    super.initState();
    // Default to pilot mode if they are a driver for demonstration, or default to passenger. 
    // Let's default to passenger.
  }

  void _togglePilotMode() {
    setState(() {
      _isPilotMode = !_isPilotMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(isPilotMode: _isPilotMode),
      const TripsScreen(),
      const WalletScreen(),
      ProfileScreen(
        onLogout: widget.onLogout, 
        isDriver: widget.isDriver,
        isPilotMode: _isPilotMode,
        onTogglePilotMode: _togglePilotMode,
      ),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}