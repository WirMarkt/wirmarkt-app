// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImpactItem _$ImpactItemFromJson(Map<String, dynamic> json) => ImpactItem(
      name: json['name'] as String,
      coverImage: json['cover_image'] as String,
      backgroundColor:
          const ColorSerializer().fromJson(json['background_color'] as String?),
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) =>
                  ImpactItemTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ImpactItemToJson(ImpactItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'background_color':
          const ColorSerializer().toJson(instance.backgroundColor),
      'cover_image': instance.coverImage,
      'translations': instance.translations,
    };

ImpactItemTranslation _$ImpactItemTranslationFromJson(
        Map<String, dynamic> json) =>
    ImpactItemTranslation(
      json['languages_code'] as String,
      json['title'] as String,
      json['subtext'] as String,
    );

Map<String, dynamic> _$ImpactItemTranslationToJson(
        ImpactItemTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'title': instance.title,
      'subtext': instance.subtext,
    };
