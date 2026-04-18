import 'package:flutter/material.dart';
import 'widgets/auth_widgets.dart';

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
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_emailCtrl.text.trim().isEmpty || _passwordCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Por favor completa todos los campos'),
          backgroundColor: kDarkToast,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }
    widget.onLogin();
  }

  void _socialComingSoon(String method) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Acceso con $method próximamente disponible'),
        backgroundColor: kDarkToast,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              const GoodDriveLogo(),
              const SizedBox(height: 36),

              // Título
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: kDarkText,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Bienvenido de vuelta a GoodDrive.',
                style: TextStyle(fontSize: 16, color: kGrayText),
              ),
              const SizedBox(height: 30),

              // Botones sociales
              Row(
                children: [
                  Expanded(
                    child: AuthSocialButton(
                      icon: const GoogleIcon(),
                      label: 'Google',
                      onTap: () => _socialComingSoon('Google'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AuthSocialButton(
                      icon: const Icon(Icons.phone_android_rounded,
                          size: 20, color: Color(0xFF3B5BDB)),
                      label: 'Teléfono',
                      onTap: () => _socialComingSoon('Teléfono'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const AuthOrDivider(),
              const SizedBox(height: 24),

              // Email
              const AuthFieldLabel(label: 'CORREO ELECTRÓNICO'),
              const SizedBox(height: 8),
              AuthTextField(
                controller: _emailCtrl,
                hint: 'nombre@empresa.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Contraseña
              const AuthFieldLabel(label: 'CONTRASEÑA'),
              const SizedBox(height: 8),
              AuthTextField(
                controller: _passwordCtrl,
                hint: '••••••••',
                obscureText: _obscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: kGrayText,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              const SizedBox(height: 12),

              // Olvidé contraseña
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            'Recuperación de contraseña próximamente'),
                        backgroundColor: kDarkToast,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  },
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      fontSize: 13,
                      color: kGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Botón principal
              AuthPrimaryButton(
                label: 'Iniciar Sesión',
                onTap: _handleLogin,
              ),
              const SizedBox(height: 20),

              // Link a registro
              Center(
                child: GestureDetector(
                  onTap: widget.onToggle,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: kGrayText),
                      children: [
                        TextSpan(text: '¿No tienes una cuenta? '),
                        TextSpan(
                          text: 'Crear cuenta',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Footer
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 12, color: Color(0xFF9CA3AF)),
                    children: [
                      const TextSpan(
                          text: 'Al ingresar, aceptas nuestros '),
                      TextSpan(
                        text: 'Términos de Servicio',
                        style: TextStyle(
                          color: kGrayText.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: ' y '),
                      TextSpan(
                        text: 'Política de Privacidad',
                        style: TextStyle(
                          color: kGrayText.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}