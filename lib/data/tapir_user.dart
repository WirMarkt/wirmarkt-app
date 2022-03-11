import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'tapir_user.g.dart';

@JsonSerializable()
@immutable
class TapirUser {
  final int id;
  @JsonKey(name: "last_login") //: "2022-03-06T16:34:58.870715+01:00",
  final String lastLogin;
  @JsonKey(name: "is_superuser") //: false,
  final bool isSuperuser;
  @JsonKey(name: "first_name") //: "Elia",
  final String firstName;
  @JsonKey(name: "last_name") //: "Fontai",
  final String lastName;
  final String email;
  @JsonKey(name: "is_staff") //: false,
  final bool isStaff;
  @JsonKey(name: "is_active") //: true,
  final bool isActive;
  @JsonKey(name: "date_joined") //: "2008-09-22T05:11:38.037000+02:00",
  final DateTime dateJoined;
  final String username;
  @JsonKey(name: "phone_number") //: "+49386111139",
  final String phoneNumber;
  final String birthdate;
  final String street;
  @JsonKey(name: "street_2") //: "",
  final String street2;
  final String postcode;
  final String city;
  final String country;
  @JsonKey(name: "preferred_language") //: "en",
  final String preferredLanguage;

  @JsonKey(name: "share_owner")
  final ShareOwner? shareOwner;
  @JsonKey(name: "shift_user_data")
  final ShiftUserData? shiftUserData;

  const TapirUser({
    required this.id,
    required this.lastLogin,
    required this.isSuperuser,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.username,
    required this.phoneNumber,
    required this.birthdate,
    required this.street,
    required this.street2,
    required this.postcode,
    required this.city,
    required this.country,
    required this.preferredLanguage,
    required this.shareOwner,
    required this.shiftUserData,
  });

  factory TapirUser.fromJson(Map<String, dynamic> json) =>
      _$TapirUserFromJson(json);

  Map<String, dynamic> toJson() => _$TapirUserToJson(this);
}
