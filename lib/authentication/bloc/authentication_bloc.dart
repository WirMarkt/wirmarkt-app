import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    //required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        // _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStateChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationRefreshRequested>(_onAuthenticationRefreshRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (state) => add(AuthenticationStateChanged(state)),
    );
    //init auth from storage
    _authenticationRepository.refreshFromStorage();
  }

  final AuthenticationRepository _authenticationRepository;

  ///subscription for listening to updates from [_authenticationRepository]
  late StreamSubscription<AuthenticationState>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStateChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.state.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final jwtToken = event.state.jwtToken;
        return emit(jwtToken.isNotExpired
            ? AuthenticationState.authenticated(jwtToken)
            : const AuthenticationState.unauthenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  void _onAuthenticationRefreshRequested(
    AuthenticationRefreshRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    if (state.status == AuthenticationStatus.authenticated) {
      try {
        _authenticationRepository.refreshToken(state.jwtToken);
      } on ApiException {
        emit(const AuthenticationState.unauthenticated());
      }
    }
  }
}
