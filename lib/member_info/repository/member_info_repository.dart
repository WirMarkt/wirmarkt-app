import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';
import 'package:wir_markt/member_info/model/member_info.dart';

@immutable
class MemberInfoRepository {
  final ApiRepository _apiRepository;

  const MemberInfoRepository(this._apiRepository);

  Future<MemberInfo?> getMemberInfo(JwtToken jwtToken) async {
    var jsonResponse =
        await _apiRepository.get("/member_info", jwtToken: jwtToken);
    return MemberInfo.fromJson(jsonResponse);
  }
}
