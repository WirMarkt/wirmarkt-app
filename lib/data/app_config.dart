import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
@immutable
class AppConfig {
  const AppConfig(this.apiUrl);

  final String apiUrl;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  static Future<AppConfig> forEnvironment({String? env = 'dev'}) async {
    // load the json file
    final contents = await rootBundle.loadString(
      'config/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig.fromJson(json);
  }
}
