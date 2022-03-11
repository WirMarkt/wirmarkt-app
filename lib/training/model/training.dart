import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/translation.dart';

part 'training.g.dart';

@JsonSerializable()
@immutable
class Training with HasTranslations<TrainingTranslation> {
  static const Training empty =
      Training(name: "", coverImage: "", translations: []);

  @JsonKey(name: 'contents')
  @_TrainingContentConverter()
  final List<TrainingContent> contents;

  const Training(
      {required this.name,
      this.coverImage,
      this.translations = const [],
      this.contents = const []});

  final String name;
  @JsonKey(name: "cover_image")
  final String? coverImage;
  @override
  final List<TrainingTranslation> translations;

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingToJson(this);
}

@immutable
@JsonSerializable()
class TrainingTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final String title;
  final String description;

  const TrainingTranslation(
      {required this.languageName, this.title = "", this.description = ""});

  factory TrainingTranslation.fromJson(Map<String, dynamic> json) =>
      _$TrainingTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingTranslationToJson(this);
}

class _TrainingContentConverter
    implements JsonConverter<TrainingContent, Map<String, dynamic>> {
  const _TrainingContentConverter();

  @override
  TrainingContent fromJson(Map<String, dynamic> json) {
    if (json['collection'] == "questions") {
      return Question.fromJson(json['item']);
    } else if (json['collection'] == "training_sections") {
      return TrainingSection.fromJson(json['item']);
    }
    throw Exception("invalid input");
  }

  // This will only work if `object` is a native JSON type:
  //   num, String, bool, null, etc
  // Or if it has a `toJson()` function`.
  @override
  Map<String, dynamic> toJson(TrainingContent object) => object.toJson();
}

abstract class TrainingContent {
  Map<String, dynamic> toJson();

  const TrainingContent();
}

@immutable
@JsonSerializable()
class Question extends TrainingContent
    with HasTranslations<QuestionTranslation> {
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

@immutable
@JsonSerializable()
class Answer extends TrainingContent with HasTranslations<AnswerTranslation> {
  final int id;
  final String name;
  @JsonKey(name:"is_correct")
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

  @override
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

@immutable
@JsonSerializable()
class TrainingSection extends TrainingContent
    with HasTranslations<TrainingSectionTranslation> {
  final int id;
  final String name;
  final String status;
  @JsonKey(name: "cover_image")
  final String? coverImage;
  @override
  final List<TrainingSectionTranslation> translations;

  TrainingSection(
      {required this.id,
      required this.name,
      required this.status,
      this.coverImage,
      this.translations = const []});

  factory TrainingSection.fromJson(Map<String, dynamic> json) =>
      _$TrainingSectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TrainingSectionToJson(this);
}

@immutable
@JsonSerializable()
class TrainingSectionTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final String title;
  final String introduction;
  @JsonKey(name: "key_takeaways")
  final String keyTakeaways;

  TrainingSectionTranslation(
      {required this.languageName,
      this.title = "",
      this.introduction = "",
      this.keyTakeaways = ""});

  factory TrainingSectionTranslation.fromJson(Map<String, dynamic> json) =>
      _$TrainingSectionTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingSectionTranslationToJson(this);
}
