part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStateChanged extends AuthenticationEvent {
  const AuthenticationStateChanged(this.state);

  final AuthenticationState state;

  @override
  List<Object> get props => [state];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationRefreshRequested extends AuthenticationEvent {}
