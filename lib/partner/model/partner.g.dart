// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partner _$PartnerFromJson(Map<String, dynamic> json) => Partner(
      organizationName: json['organization_name'] as String,
      partnerType: $enumDecode(_$PartnerTypeEnumMap, json['partner_type']),
      coverImage: json['cover_image'] as String,
      translations: (json['translations'] as List<dynamic>?)
              ?.map(
                  (e) => PartnerTranslation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => File.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'organization_name': instance.organizationName,
      'partner_type': _$PartnerTypeEnumMap[instance.partnerType]!,
      'cover_image': instance.coverImage,
      'translations': instance.translations,
      'photos': instance.photos,
    };

const _$PartnerTypeEnumMap = {
  PartnerType.supplier: 'supplier',
  PartnerType.person: 'person',
  PartnerType.initiative: 'initiative',
};

PartnerTranslation _$PartnerTranslationFromJson(Map<String, dynamic> json) =>
    PartnerTranslation(
      languageName: json['languages_code'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      partnershipDescription: json['partnership_description'] as String?,
    );

Map<String, dynamic> _$PartnerTranslationToJson(PartnerTranslation instance) =>
    <String, dynamic>{
      'languages_code': instance.languageName,
      'tags': instance.tags,
      'partnership_description': instance.partnershipDescription,
    };
