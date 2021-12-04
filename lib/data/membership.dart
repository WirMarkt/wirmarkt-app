import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'membership.g.dart';

@JsonSerializable()
@immutable
class Membership {
  Membership(this.qr);

  final String qr;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Membership.fromJson(Map<String, dynamic> json) => _$MembershipFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$MembershipToJson(this);
}
