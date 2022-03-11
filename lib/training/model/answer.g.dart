// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
