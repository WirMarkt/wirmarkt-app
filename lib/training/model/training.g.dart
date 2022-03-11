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

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as int,
      name: json['name'] as String,
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) =>
                  QuestionTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'translations': instance.translations,
      'answers': instance.answers,
    };

QuestionTranslation _$QuestionTranslationFromJson(Map<String, dynamic> json) =>
    QuestionTranslation(
      languageName: json['languages_code'] as String,
      text: json['text'] as String? ?? "",
    );

Map<String, dynamic> _$QuestionTranslationToJson(
        QuestionTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'text': instance.text,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      id: json['id'] as int,
      name: json['name'] as String,
      isCorrect: json['is_correct'] as bool,
      translations: (json['translations'] as List<dynamic>)
          .map((e) => AnswerTranslation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_correct': instance.isCorrect,
      'translations': instance.translations,
    };

AnswerTranslation _$AnswerTranslationFromJson(Map<String, dynamic> json) =>
    AnswerTranslation(
      languageName: json['languages_code'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$AnswerTranslationToJson(AnswerTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'text': instance.text,
    };

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
