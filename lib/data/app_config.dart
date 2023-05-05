import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
@immutable
class AppConfig {
  static late AppConfig _appConfig;

  Duration get connectionTimeoutDuration =>
      Duration(seconds: connectionTimeoutSeconds);

  static AppConfig get() => _appConfig;

  const AppConfig({
    required this.orgName,
    required this.apiUrl,
    this.contentApiUrl = "",
    this.passwordResetUrl = "",
    this.chatUrl = "",
    this.applyForMembershipUrl = "",
    this.connectionTimeoutSeconds = 30,
    this.ignoreCanShop = false,
    required this.memberManagementUrl,
  });

  final String orgName;

  final String apiUrl;
  final String contentApiUrl;
  final String passwordResetUrl;
  final String chatUrl;
  final String applyForMembershipUrl;
  final String memberManagementUrl;
  final bool ignoreCanShop;
  final int connectionTimeoutSeconds;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Uri get passwordResetUri => Uri.parse(passwordResetUrl);

  Uri get applyForMembershipUri => Uri.parse(applyForMembershipUrl);

  Uri get memberManagementUri => Uri.parse(memberManagementUrl);

  Uri get chatUri => Uri.parse(chatUrl);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  static Future<void> initFromEnvironment({String? env = 'dev'}) async {
    // load the json file
    final contents = await rootBundle.loadString(
      'config/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    _appConfig = AppConfig.fromJson(json);
  }
}
