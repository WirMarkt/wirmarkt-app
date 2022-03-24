import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/data/app_config.dart';

import '../model/partner.dart';

@immutable
class PartnerRepository {
  final ApiRepository _apiRepository;

  const PartnerRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<List<Partner>?> getPartners() async {
    var jsonResponse = await _apiRepository.get("/items/partners/"
        "?fields="
        "*,"
        "translations.*,"
        "photos.*"
        "&filter[status]=published");
    var contentList =
        (jsonResponse['data'] as List).map((x) => x as Map<String, dynamic>);

    return contentList.map(Partner.fromJson).toList();
  }

  String getAssetUrl(String assetPath, {String? presetKey}) {
    var url = "${AppConfig.get().contentApiUrl}/assets/$assetPath";
    var uri = Uri.parse(url);
    Map<String, dynamic> queryParams = {};
    if (presetKey != null) {
      queryParams["key"] = presetKey;
    }
    return uri.replace(queryParameters: queryParams).toString();
  }
}
