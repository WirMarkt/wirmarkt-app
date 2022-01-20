import 'dart:async';

import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

//TODO using a separate class, also store access token in secure storage for "remember"

class AuthenticationRepository {
  final ApiRepository _apiRepository;

  final _controller = StreamController<AuthenticationState>();

  AuthenticationRepository(this._apiRepository);

  /// stream to notify changes to authentication to listening blocs
  Stream<AuthenticationState> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield const AuthenticationState.unauthenticated();
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      var jsonResponse = await _apiRepository
          .post("/token/", body: {"username": username, "password": password});
      var responseToken = JwtToken.fromJson(jsonResponse);
      _controller.add(AuthenticationState.authenticated(responseToken));
    } on ApiException {
      _controller.add(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> refreshToken(JwtToken jwtToken) async {
    try {
      var jsonResponse =
          await _apiRepository.post("/token/refresh/", body: jwtToken.toJson());
      var responseToken = JwtToken.fromJson(jsonResponse);
      var refreshedToken = JwtToken(responseToken.accessToken,
          responseToken.refreshToken ?? jwtToken.refreshToken);
      _controller.add(AuthenticationState.authenticated(refreshedToken));
    } on ApiException {
      _controller.add(const AuthenticationState.unauthenticated());
    }
  }

  void logOut() {
    _controller.add(const AuthenticationState.unauthenticated());
  }

  void dispose() => _controller.close();
}
