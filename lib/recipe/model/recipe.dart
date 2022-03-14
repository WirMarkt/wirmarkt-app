import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@immutable
@JsonSerializable()
class Recipe {
  final int id;
  final String status;
  final int sort;
  @JsonKey(name: "date_created")
  final DateTime dateCreated;
  @JsonKey(name: "cover_image")
  final String coverImage;
  final String title;
  final String? summary;
  @JsonKey(name: "languages_code")
  final String languageName;

  @JsonKey(name: "recipe_ingredients")
  final List<RecipeIngredient> recipeIngredients;

  final String? instructions;
  final String? notes;
  final List<String> tags;

  @JsonKey(name: "credits_url")
  final String? creditsUrl;
  @JsonKey(name: "preparation_time")
  final int? preparationTime;
  @JsonKey(name: "working_time")
  final int? workingTime;

  const Recipe({
    required this.id,
    required this.status,
    this.sort = 0,
    required this.dateCreated,
    required this.coverImage,
    required this.title,
    this.summary,
    required this.languageName,
    required this.recipeIngredients,
    this.instructions,
    this.notes,
    this.tags = const [],
    this.creditsUrl,
    this.preparationTime,
    this.workingTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@immutable
@JsonSerializable()
class RecipeIngredient {
  final String amount;
  final String ingredient;

  const RecipeIngredient({this.amount = "", required this.ingredient});

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}
