import 'package:flutter/material.dart';
import '../../features/auth/presentation/auth_wrapper.dart';
import 'main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool isLoggedIn = false;
  bool isDriver = false;
  bool isLoading = true;

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    final driver = prefs.getBool('isDriver') ?? false;

    setState(() {
      isLoggedIn = true;
      isDriver = driver;
    });
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.setBool('isDriver', false); // reset driver state on logout or maybe keep it? Let's reset for testing purposes, actually better to keep it since it's a profile trait, but resetting is fine if we want to test again. Let's keep it.

    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (isLoggedIn) {
      return MainScreen(onLogout: logout, isDriver: isDriver);
    } else {
      return AuthScreenWrapper(onLogin: login);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final logged = prefs.getBool('isLoggedIn') ?? false;
    final driver = prefs.getBool('isDriver') ?? false;

    setState(() {
      isLoggedIn = logged;
      isDriver = driver;
      isLoading = false;
    });
  }
}