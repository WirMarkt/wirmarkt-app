import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wir_markt/utils/color_utils.dart';

import '../../utils/translation.dart';

part 'impact_content.g.dart';

@JsonSerializable()
@immutable
class ImpactContent with HasTranslations<ImpactContentTranslation> {
  static const ImpactContent empty =
      ImpactContent(name: "", coverImage: "", translations: []);

  const ImpactContent(
      {required this.name,
      required this.coverImage,
        this.backgroundColor,
      this.translations = const []});

  final String name;
  @JsonKey(name: "background_color")
  @ColorSerializer()
  final Color? backgroundColor;
  @JsonKey(name: "cover_image")
  final String coverImage;
  @override
  final List<ImpactContentTranslation> translations;

  factory ImpactContent.fromJson(Map<String, dynamic> json) =>
      _$ImpactContentFromJson(json);

  Map<String, dynamic> toJson() => _$ImpactContentToJson(this);
}

@immutable
@JsonSerializable()
class ImpactContentTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final String title;
  final String subtext;

  const ImpactContentTranslation(this.languageName, this.title, this.subtext);

  factory ImpactContentTranslation.fromJson(Map<String, dynamic> json) =>
      _$ImpactContentTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$ImpactContentTranslationToJson(this);
}