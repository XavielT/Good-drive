import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final VoidCallback onToggle;

  const RegisterScreen({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onToggle,
              child: const Text('Go to Login'),
            )
          ],
        ),
      ),
    );
  }
}