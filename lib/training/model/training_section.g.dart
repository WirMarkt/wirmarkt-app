// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingSection _$TrainingSectionFromJson(Map<String, dynamic> json) =>
    TrainingSection(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      coverImage: json['cover_image'] as String?,
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) => TrainingSectionTranslation.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TrainingSectionToJson(TrainingSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'cover_image': instance.coverImage,
      'translations': instance.translations,
    };

TrainingSectionTranslation _$TrainingSectionTranslationFromJson(
        Map<String, dynamic> json) =>
    TrainingSectionTranslation(
      languageName: json['languages_code'] as String,
      title: json['title'] as String? ?? "",
      introduction: json['introduction'] as String? ?? "",
      keyTakeaways: json['key_takeaways'] as String? ?? "",
    );

Map<String, dynamic> _$TrainingSectionTranslationToJson(
        TrainingSectionTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'title': instance.title,
      'introduction': instance.introduction,
      'key_takeaways': instance.keyTakeaways,
    };
