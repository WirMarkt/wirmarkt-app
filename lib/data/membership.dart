import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'membership.g.dart';

@JsonSerializable()
@immutable
class Membership {
  const Membership(this.qr);

  final String qr;

  factory Membership.fromJson(Map<String, dynamic> json) =>
      _$MembershipFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipToJson(this);
}
