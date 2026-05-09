import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'core/presentation/app_wrapper.dart';
import 'core/presentation/error_boundary.dart';
import 'core/data/repositories/auth_repository.dart';
import 'core/data/repositories/trip_repository.dart';
import 'core/data/services/auth_service.dart';
import 'core/data/services/trip_service.dart';
import 'core/data/services/notification_service.dart';
import 'core/blocs/auth_bloc.dart';
import 'core/blocs/trip_bloc.dart';
import 'core/blocs/connectivity_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize notification service
  await NotificationService.initialize();

  // Initialize services
  final authService = AuthService();
  final tripService = TripService();

  // Initialize repositories
  final authRepository = AuthRepository(authService);
  final tripRepository = TripRepository(tripService);

  runApp(MyApp(
    authRepository: authRepository,
    tripRepository: tripRepository,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final TripRepository tripRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.tripRepository,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorBoundary(
      onError: (error, stack) {
        // Log to crash reporting
        print('Error caught by boundary: $error');
        print('Stack trace: $stack');
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authRepository)..add(AuthCheckStatusRequested()),
          ),
          BlocProvider(
            create: (context) => TripBloc(tripRepository),
          ),
          BlocProvider(
            create: (context) => ConnectivityBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Good Drive',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const AppWrapper(),
        ),
      ),
    );
  }
}