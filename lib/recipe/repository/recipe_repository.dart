import 'package:flutter/foundation.dart';
import 'package:wir_markt/api/repository/api_repository.dart';
import 'package:wir_markt/data/app_config.dart';

import '../model/recipe.dart';

@immutable
class RecipeRepository {
  final ApiRepository _apiRepository;

  const RecipeRepository(this._apiRepository);

  /// @throws [ApiException]
  Future<List<Recipe>?> getRecipes({required String languageCode}) async {
    var jsonResponse = await _apiRepository.get("/items/recipes/"
        "?fields=*,recipe_ingredients.amount,recipe_ingredients.ingredient"
        "&filter[status]=published");
    var contentList = (jsonResponse['data'] as List)
        .map((x) => x as Map<String, dynamic>)
        //fetch all languages and filter here - that's inefficient, but we don't have country codes necessary to filter
        .where((m) => m['languages_code'].startsWith(languageCode));

    return contentList.map(Recipe.fromJson).toList();
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
