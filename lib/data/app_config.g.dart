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
      chatUrl: json['chatUrl'] as String? ?? "",
      applyForMembershipUrl: json['applyForMembershipUrl'] as String? ?? "",
      connectionTimeoutSeconds: json['connectionTimeoutSeconds'] as int? ?? 30,
      ignoreCanShop: json['ignoreCanShop'] as bool? ?? false,
      showResetPassword: json['showResetPassword'] as bool? ?? true,
      showApplyForMembership: json['showApplyForMembership'] as bool? ?? true,
      showSuggestProduct: json['showSuggestProduct'] as bool? ?? true,
      memberManagementUrl: json['memberManagementUrl'] as String,
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'orgName': instance.orgName,
      'apiUrl': instance.apiUrl,
      'contentApiUrl': instance.contentApiUrl,
      'passwordResetUrl': instance.passwordResetUrl,
      'chatUrl': instance.chatUrl,
      'applyForMembershipUrl': instance.applyForMembershipUrl,
      'memberManagementUrl': instance.memberManagementUrl,
      'ignoreCanShop': instance.ignoreCanShop,
      'showApplyForMembership': instance.showApplyForMembership,
      'showResetPassword': instance.showResetPassword,
      'showSuggestProduct': instance.showSuggestProduct,
      'connectionTimeoutSeconds': instance.connectionTimeoutSeconds,
    };
