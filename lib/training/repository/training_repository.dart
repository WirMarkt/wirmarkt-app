import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/data/app_config.dart';

import '../model/training.dart';

@immutable
class TrainingRepository {
  final ApiRepository _apiRepository;

  const TrainingRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<Training?> getTraining({required String name}) async {
    var jsonResponse = await _apiRepository.get(
        "/items/trainings/"
            "?fields="
            "*,"
            "translations.*,"
            "contents.*,"
            "contents.item.*,"
            "contents.item.translations.*"
            "contents.item.answers.*"
            "contents.item.answers.translations.*"
            "&filter[status]=published&filter[name]=$name"
    );
    var contentList =
        (jsonResponse['data'] as List).map((x) => x as Map<String, dynamic>);

    var matches = contentList.map(Training.fromJson).toList();
    if (matches.isNotEmpty) {
      return matches.first;
    } else {
      return null;
    }
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
