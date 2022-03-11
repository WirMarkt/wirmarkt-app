// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Training _$TrainingFromJson(Map<String, dynamic> json) => Training(
      name: json['name'] as String,
      coverImage: json['cover_image'] as String?,
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) =>
                  TrainingTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => const _TrainingContentConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TrainingToJson(Training instance) => <String, dynamic>{
      'contents': instance.contents
          .map(const _TrainingContentConverter().toJson)
          .toList(),
      'name': instance.name,
      'cover_image': instance.coverImage,
      'translations': instance.translations,
    };

TrainingTranslation _$TrainingTranslationFromJson(Map<String, dynamic> json) =>
    TrainingTranslation(
      languageName: json['languages_code'] as String,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$TrainingTranslationToJson(
        TrainingTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'title': instance.title,
      'description': instance.description,
    };
