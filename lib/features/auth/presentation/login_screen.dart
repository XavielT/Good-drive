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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              const Text(
                'Good Drive',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                'Ingresa a tu cuenta',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              const Text('Correo o número de teléfono'),
              const SizedBox(height: 5),

              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'ej: 809-000-1234',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const Text('Contraseña'),
              const SizedBox(height: 5),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '********',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleLogin,
                  child: const Text('Iniciar sesión'),
                ),
              ),

              const SizedBox(height: 15),

              Center(
                child: TextButton(
                  onPressed: widget.onToggle,
                  child: const Text('Crear cuenta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}