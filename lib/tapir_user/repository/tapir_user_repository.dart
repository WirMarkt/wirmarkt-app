import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';

import '../../data/data.dart';

@immutable
class TapirUserRepository {
  final ApiRepository _apiRepository;

  const TapirUserRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<TapirUser?> getTapirUser(JwtToken jwtToken) async {
    var jsonResponse =
        await _apiRepository.get("/tapir_user/", jwtToken: jwtToken);
    return TapirUser.fromJson(jsonResponse);
  }
}

