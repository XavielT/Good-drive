import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  final VoidCallback onToggle;
  final VoidCallback onLogin;

  const LoginScreen({
    super.key,
    required this.onToggle,
    required this.onLogin,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }


    widget.onLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Good Drive',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            const Text(
              'Ingresa a tu cuenta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Correo o numero de telefono'),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Manolo@gmail.com / 809-000-1234',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            const Text('Contraseña'),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '********',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Iniciar sesión'),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: widget.onToggle,
              child: const Text('Crear cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}