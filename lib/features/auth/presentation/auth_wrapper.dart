import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_screen.dart';
import '../../../core/blocs/auth_bloc.dart';

class AuthScreenWrapper extends StatelessWidget {
  final VoidCallback onLogin;

  const AuthScreenWrapper({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          onLogin();
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          );
        }
      },
      child: AuthScreenWithLogin(onLogin: onLogin),
    );
  }
}