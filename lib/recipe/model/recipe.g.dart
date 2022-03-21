// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as int,
      status: json['status'] as String,
      sort: json['sort'] as int? ?? 0,
      dateCreated: DateTime.parse(json['date_created'] as String),
      coverImage: json['cover_image'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String?,
      languageName: json['languages_code'] as String,
      recipeIngredients: (json['recipe_ingredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: json['instructions'] as String?,
      notes: json['notes'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      creditsUrl: json['credits_url'] as String?,
      preparationTime: json['preparation_time'] as int?,
      workingTime: json['working_time'] as int?,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'sort': instance.sort,
      'date_created': instance.dateCreated.toIso8601String(),
      'cover_image': instance.coverImage,
      'title': instance.title,
      'summary': instance.summary,
      'languages_code': instance.languageName,
      'recipe_ingredients': instance.recipeIngredients,
      'instructions': instance.instructions,
      'notes': instance.notes,
      'tags': instance.tags,
      'credits_url': instance.creditsUrl,
      'preparation_time': instance.preparationTime,
      'working_time': instance.workingTime,
    };

RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) =>
    RecipeIngredient(
      amount: json['amount'] as String? ?? "",
      ingredient: json['ingredient'] as String,
    );

Map<String, dynamic> _$RecipeIngredientToJson(RecipeIngredient instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'ingredient': instance.ingredient,
    };
