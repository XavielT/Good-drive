import 'package:flutter/material.dart';

// ─── Colores del tema auth ──────────────────────────────────────────────────
const kBgColor = Color(0xFFF5F2EE);
const kGreen = Color(0xFF22C55E);
const kGreenDark = Color(0xFF16A34A);
const kDarkText = Color(0xFF1A1A1A);
const kGrayText = Color(0xFF6B7280);
const kInputBg = Color(0xFFEEEBE7);
const kDarkToast = Color(0xFF1F2937);

// ─── Logo Good Drive ────────────────────────────────────────────────────────
class GoodDriveLogo extends StatelessWidget {
  const GoodDriveLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: kGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.directions_car_rounded,
              color: Colors.white, size: 22),
        ),
        const SizedBox(width: 8),
        const Text(
          'Good Drive',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: kGreen,
          ),
        ),
      ],
    );
  }
}

// ─── Botón social (Google / Teléfono) ───────────────────────────────────────
class AuthSocialButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const AuthSocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kDarkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Ícono Google (G multicolor) ────────────────────────────────────────────
class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(painter: _GooglePainter()),
    );
  }
}

class _GooglePainter extends CustomPainter {
  const _GooglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;
    final stroke = size.width * 0.18;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    const pi = 3.14159265358979;

    final arcs = [
      [const Color(0xFF4285F4), -pi / 2, pi / 2],
      [const Color(0xFF34A853), 0.0, pi / 2],
      [const Color(0xFFFBBC05), pi / 2, pi / 2],
      [const Color(0xFFEA4335), pi, pi / 2],
    ];

    for (final a in arcs) {
      paint.color = a[0] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: c, radius: r - stroke / 2),
        a[1] as double,
        a[2] as double,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

// ─── Divisor OR ─────────────────────────────────────────────────────────────
class AuthOrDivider extends StatelessWidget {
  const AuthOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFD1CEC9), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'O',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kGrayText.withOpacity(0.7),
              letterSpacing: 1,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFD1CEC9), thickness: 1)),
      ],
    );
  }
}

// ─── Label de campo ─────────────────────────────────────────────────────────
class AuthFieldLabel extends StatelessWidget {
  final String label;
  const AuthFieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: kGrayText,
        letterSpacing: 1.0,
      ),
    );
  }
}

// ─── TextField redondeado ────────────────────────────────────────────────────
class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextStyle? style;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: style ??
          const TextStyle(fontSize: 15, color: kDarkText),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: kGrayText.withOpacity(0.6), fontSize: 15),
        filled: true,
        fillColor: kInputBg,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: kGreen, width: 1.5),
        ),
      ),
    );
  }
}

// ─── Botón CTA verde degradado ───────────────────────────────────────────────
class AuthPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kGreenDark, kGreen],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: kGreen.withOpacity(0.38),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_rounded,
                color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

// ─── Toast de oferta ─────────────────────────────────────────────────────────
class AuthToastBanner extends StatelessWidget {
  final String message;
  const AuthToastBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: kDarkToast,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.28),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.warning_amber_rounded,
                color: Color(0xFFF59E0B), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
