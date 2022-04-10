part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final UserAuthentification userAuthentification;

  AuthLoginEvent(this.userAuthentification);
}
