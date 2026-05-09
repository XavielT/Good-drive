import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../data/services/connectivity_service.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityCheckRequested>(_onCheckRequested);
    on<ConnectivityChanged>(_onChanged);

    // Listen to connectivity changes
    ConnectivityService.connectivityStream.listen((result) {
      add(ConnectivityChanged(result));
    });

    // Initial check
    add(ConnectivityCheckRequested());
  }

  Future<void> _onCheckRequested(
    ConnectivityCheckRequested event,
    Emitter<ConnectivityState> emit,
  ) async {
    final isConnected = await ConnectivityService.isConnected;
    emit(isConnected ? ConnectivityOnline() : ConnectivityOffline());
  }

  void _onChanged(
    ConnectivityChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    final isOnline = event.result != ConnectivityResult.none;
    emit(isOnline ? ConnectivityOnline() : ConnectivityOffline());
  }
}