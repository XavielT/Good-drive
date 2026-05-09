import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/auth_wrapper.dart';
import 'main_screen.dart';
import '../blocs/auth_bloc.dart';
import '../data/models/user_model.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading || state is AuthInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AuthAuthenticated) {
          return MainScreen(
            onLogout: () => context.read<AuthBloc>().add(AuthLogoutRequested()),
            isDriver: state.user.role == UserRole.driver,
          );
        }

        return AuthScreenWrapper(
          onLogin: () {
            // Auth state will be updated by the bloc
          },
        );
      },
    );
  }
}