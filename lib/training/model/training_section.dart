import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/translation.dart';
import 'training.dart';

part 'training_section.g.dart';

@immutable
@JsonSerializable()
class TrainingSection extends TrainingContent
    with HasTranslations<TrainingSectionTranslation> {
  @override
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


  @override
  String get typeName => "training_section";
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
