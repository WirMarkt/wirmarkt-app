import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/translation.dart';
import 'answer.dart';
import 'training.dart';

part 'question.g.dart';

@immutable
@JsonSerializable()
class Question extends TrainingContent
    with HasTranslations<QuestionTranslation> {
  @override
  final int id;

  final String name;
  @override
  final List<QuestionTranslation> translations;

  final List<Answer> answers;

  const Question({
    required this.id,
    required this.name,
    this.translations = const [],
    this.answers = const [],
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String get typeName => "question";
}

@immutable
@JsonSerializable()
class QuestionTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final String text;

  const QuestionTranslation({required this.languageName, this.text = ""});

  factory QuestionTranslation.fromJson(Map<String, dynamic> json) =>
      _$QuestionTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTranslationToJson(this);
}
