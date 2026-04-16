import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class AuthScreenWithLogin extends StatefulWidget {
  final VoidCallback onLogin;

  const AuthScreenWithLogin({super.key, required this.onLogin});

  @override
  State<AuthScreenWithLogin> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreenWithLogin> {
  bool showLogin = true;

  void toggleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLogin
          ? LoginScreen(
        onToggle: toggleScreen,
        onLogin: widget.onLogin,
      )
          : RegisterScreen(
        onToggle: toggleScreen,
      ),
    );
  }
}