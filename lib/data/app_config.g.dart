// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      orgName: json['orgName'] as String,
      apiUrl: json['apiUrl'] as String,
      contentApiUrl: json['contentApiUrl'] as String? ?? "",
      passwordResetUrl: json['passwordResetUrl'] as String? ?? "",
      applyForMembershipUrl: json['applyForMembershipUrl'] as String? ?? "",
      memberManagementUri: json['memberManagementUri'] as String,
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'orgName': instance.orgName,
      'apiUrl': instance.apiUrl,
      'contentApiUrl': instance.contentApiUrl,
      'passwordResetUrl': instance.passwordResetUrl,
      'applyForMembershipUrl': instance.applyForMembershipUrl,
      'memberManagementUri': instance.memberManagementUri,
    };
