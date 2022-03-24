import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/data.dart';
import '../../utils/translation.dart';

part 'partner.g.dart';

@JsonSerializable()
@immutable
class Partner with HasTranslations<PartnerTranslation> {
  const Partner(
      {required this.organizationName,
      required this.partnerType,
      required this.coverImage,
      this.translations = const [],
      this.photos = const []});

  @JsonKey(name: "organization_name")
  final String organizationName;
  @JsonKey(name: "partner_type")
  final PartnerType partnerType;
  @JsonKey(name: "cover_image")
  final String coverImage;
  @override
  final List<PartnerTranslation> translations;
  final List<File> photos;

  factory Partner.fromJson(Map<String, dynamic> json) =>
      _$PartnerFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerToJson(this);
}

enum PartnerType { supplier, person, initiative }

@immutable
@JsonSerializable()
class PartnerTranslation with HasTranslation {
  @override
  @JsonKey(name: "languages_code")
  final String languageName;
  final List<String> tags;
  @JsonKey(name: "partnership_description")
  final String? partnershipDescription;

  const PartnerTranslation(
      {required this.languageName,
      this.tags = const [],
      required this.partnershipDescription});

  factory PartnerTranslation.fromJson(Map<String, dynamic> json) =>
      _$PartnerTranslationFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerTranslationToJson(this);
}
