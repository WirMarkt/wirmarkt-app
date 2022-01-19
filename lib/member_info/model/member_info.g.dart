// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) => MemberInfo(
      canShop: json['can_shop'] as bool?,
      isPaying: json['is_paying'] as bool?,
      email: json['email'] as String,
      preferredLanguage: json['preferred_language'] as String,
    );

Map<String, dynamic> _$MemberInfoToJson(MemberInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'preferred_language': instance.preferredLanguage,
      'can_shop': instance.canShop,
      'is_paying': instance.isPaying,
    };
