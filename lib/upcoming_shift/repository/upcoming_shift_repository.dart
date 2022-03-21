import 'package:flutter/foundation.dart';

import '../../api/repository/api_repository.dart';
import '../../authentication/models/jwt_token.dart';
import '../../data/data.dart';

@immutable
class UpcomingShiftRepository {
  final ApiRepository _apiRepository;

  const UpcomingShiftRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<Shift?> getUpcomingShift(JwtToken jwtToken) async {
    var jsonResponse =
        await _apiRepository.get("/shift/upcoming/", jwtToken: jwtToken);
    if (jsonResponse['id'] == null) {
      return null;
    } else {
      return Shift.fromJson(jsonResponse);
    }
  }
}
