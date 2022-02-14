// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImpactContent _$ImpactContentFromJson(Map<String, dynamic> json) =>
    ImpactContent(
      name: json['name'] as String,
      coverImage: json['cover_image'] as String,
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) =>
                  ImpactContentTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ImpactContentToJson(ImpactContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cover_image': instance.coverImage,
      'translations': instance.translations,
    };

ImpactContentTranslation _$ImpactContentTranslationFromJson(
        Map<String, dynamic> json) =>
    ImpactContentTranslation(
      json['languages_code'] as String,
      json['title'] as String,
      json['subtext'] as String,
    );

Map<String, dynamic> _$ImpactContentTranslationToJson(
        ImpactContentTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'title': instance.title,
      'subtext': instance.subtext,
    };
