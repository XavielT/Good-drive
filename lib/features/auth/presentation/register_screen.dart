import 'package:flutter/material.dart';
import 'dart:async';
import 'widgets/auth_widgets.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onToggle;
  const RegisterScreen({super.key, required this.onToggle});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _referralCtrl = TextEditingController();
  bool _obscure = true;
  bool _showToast = false;
  late AnimationController _animCtrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    _anim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _showToast = true);
      _animCtrl.forward();
      Future.delayed(const Duration(seconds: 5), () {
        if (!mounted) return;
        _animCtrl.reverse().then((_) {
          if (mounted) setState(() => _showToast = false);
        });
      });
    });
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _referralCtrl.dispose();
    super.dispose();
  }

  void _handleRegister() {
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
    // TODO: implementar lógica de registro
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
      body: Stack(
        children: [
          SafeArea(
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
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: kDarkText,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Comienza tu viaje con GoodDrive hoy.',
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
                  const SizedBox(height: 20),

                  // Código de referido
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: const Color(0xFFBBF7D0), width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.verified_user_outlined,
                                color: kGreenDark, size: 18),
                            const SizedBox(width: 6),
                            const Expanded(
                              child: Text(
                                'CÓDIGO DE REFERIDO (OPCIONAL)',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: kGreenDark,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            const Icon(Icons.card_giftcard_outlined,
                                color: kGrayText, size: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(
                          controller: _referralCtrl,
                          hint: 'Ingresa tu código de bono',
                          style: const TextStyle(
                              fontSize: 14,
                              color: kDarkText,
                              fontFamily: 'monospace'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Aplica un código para desbloquear hasta \$250 en tu primera semana.',
                          style: TextStyle(fontSize: 12, color: kGrayText),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Botón principal
                  AuthPrimaryButton(
                    label: 'Crear Cuenta',
                    onTap: _handleRegister,
                  ),
                  const SizedBox(height: 20),

                  // Link a login
                  Center(
                    child: GestureDetector(
                      onTap: widget.onToggle,
                      child: RichText(
                        text: const TextSpan(
                          style:
                              TextStyle(fontSize: 14, color: kGrayText),
                          children: [
                            TextSpan(text: '¿Ya tienes una cuenta? '),
                            TextSpan(
                              text: 'Iniciar sesión',
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
                              text:
                                  'Al crear una cuenta, aceptas nuestros '),
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

          // Toast animado
          if (_showToast)
            Positioned(
              bottom: 32,
              left: 24,
              right: 24,
              child: FadeTransition(
                opacity: _anim,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.4),
                    end: Offset.zero,
                  ).animate(_anim),
                  child: const AuthToastBanner(
                    message:
                        '¡Tiempo limitado: Bono de referido doble esta semana!',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}