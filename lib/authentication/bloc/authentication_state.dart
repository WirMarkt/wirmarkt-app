part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.jwtToken = JwtToken.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(JwtToken jwtToken)
      : this._(status: AuthenticationStatus.authenticated, jwtToken: jwtToken);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final JwtToken jwtToken;

  @override
  List<Object> get props => [status, jwtToken];
}
