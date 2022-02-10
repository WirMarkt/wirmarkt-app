import 'package:flutter/material.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';
import 'package:wir_markt/member_contribution/model/member_contribution.dart';

@immutable
class MemberContributionRepository {
  final ApiRepository _apiRepository;

  const MemberContributionRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<MemberContribution> getMemberContribution(JwtToken jwtToken) async {
    var jsonResponse =
        await _apiRepository.get("/member_contribution/", jwtToken: jwtToken);
    return MemberContribution.fromJson(jsonResponse);
  }
}
