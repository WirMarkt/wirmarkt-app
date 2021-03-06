import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/data/app_config.dart';

import '../model/impact_item.dart';

@immutable
class ImpactItemRepository {
  final ApiRepository _apiRepository;

  const ImpactItemRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<List<ImpactItem>?> getImpactItems() async {
    var jsonResponse = await _apiRepository
        .get("/items/impact_items/?fields=name,translations.*,cover_image,"
            "background_color&filter[status]=published");
    var contentList =
        (jsonResponse['data'] as List).map((x) => x as Map<String, dynamic>);

    return contentList.map(ImpactItem.fromJson).toList();
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
