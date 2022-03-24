import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wir_markt/utils/color_utils.dart';

import '../../utils/translation.dart';

part 'impact_item.g.dart';

@JsonSerializable()
@immutable
class ImpactItem with HasTranslations<ImpactItemTranslation> {
  static const ImpactItem empty =
      ImpactItem(name: "", coverImage: "", translations: []);

  const ImpactItem(
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
  final List<ImpactItemTranslation> translations;

  factory ImpactItem.fromJson(Map<String, dynamic> json) =>
      _$ImpactItemFromJson(json);

  Map<String, dynamic> toJson() => _$ImpactItemToJson(this);
}

@immutable
@JsonSerializable()
class ImpactItemTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final String title;
  final String subtext;

  const ImpactItemTranslation(this.languageName, this.title, this.subtext);

  factory ImpactItemTranslation.fromJson(Map<String, dynamic> json) =>
      _$ImpactItemTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$ImpactItemTranslationToJson(this);
}
