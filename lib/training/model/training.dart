import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/translation.dart';
import 'question.dart';
import 'training_section.dart';

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
  abstract final String typeName;
  abstract final int id;

  Map<String, dynamic> toJson();

  const TrainingContent();
}
