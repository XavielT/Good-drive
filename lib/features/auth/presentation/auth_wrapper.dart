import 'package:flutter/material.dart';
import 'auth_screen.dart';

class AuthScreenWrapper extends StatelessWidget {
  final VoidCallback onLogin;

  const AuthScreenWrapper({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWithLogin(onLogin: onLogin);
  }
}