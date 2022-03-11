// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
