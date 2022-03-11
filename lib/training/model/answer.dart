import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/translation.dart';

part 'answer.g.dart';

@immutable
@JsonSerializable()
class Answer with HasTranslations<AnswerTranslation> {
  final int id;
  final String name;
  @JsonKey(name: "is_correct")
  final bool isCorrect;
  @override
  final List<AnswerTranslation> translations;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  const Answer({
    required this.id,
    required this.name,
    required this.isCorrect,
    required this.translations,
  });

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@immutable
@JsonSerializable()
class AnswerTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final String text;

  factory AnswerTranslation.fromJson(Map<String, dynamic> json) =>
      _$AnswerTranslationFromJson(json);

  const AnswerTranslation({
    required this.languageName,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$AnswerTranslationToJson(this);
}
