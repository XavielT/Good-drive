part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthRegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final UserRole role;
  final String? referralCode;
  final String? name;

  const AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.role,
    this.referralCode,
    this.name,
  });

  @override
  List<Object?> get props => [email, password, role, referralCode, name];
}

class AuthLogoutRequested extends AuthEvent {}

class AuthCheckStatusRequested extends AuthEvent {}

class AuthProfileUpdateRequested extends AuthEvent {
  final UserModel user;

  const AuthProfileUpdateRequested(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthBecomeDriverRequested extends AuthEvent {
  final VehicleModel vehicle;

  const AuthBecomeDriverRequested(this.vehicle);

  @override
  List<Object?> get props => [vehicle];
}