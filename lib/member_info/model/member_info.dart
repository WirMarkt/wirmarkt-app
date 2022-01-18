import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_info.g.dart';

@JsonSerializable()
@immutable
class MemberInfo {
  static const MemberInfo empty = MemberInfo(email: "", preferredLanguage: "");

  const MemberInfo({required this.email, required this.preferredLanguage});

  final String email;
  @JsonKey(name: "preferred_language")
  final String preferredLanguage;

  factory MemberInfo.fromJson(Map<String, dynamic> json) =>
      _$MemberInfoFromJson(json);

  //TODO return proper QR Code for identification
  String get idQrCode => email;

  Map<String, dynamic> toJson() => _$MemberInfoToJson(this);
}
