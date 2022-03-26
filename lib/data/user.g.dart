// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      lastLogin: json['last_login'] as String?,
      isSuperuser: json['is_superuser'] as bool,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      isStaff: json['is_staff'] as bool,
      isActive: json['is_active'] as bool,
      dateJoined: DateTime.parse(json['date_joined'] as String),
      username: json['username'] as String,
      phoneNumber: json['phone_number'] as String,
      birthdate: json['birthdate'] as String,
      street: json['street'] as String,
      street2: json['street_2'] as String,
      postcode: json['postcode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      preferredLanguage: json['preferred_language'] as String,
      shareOwner: json['share_owner'] == null
          ? null
          : ShareOwner.fromJson(json['share_owner'] as Map<String, dynamic>),
      shiftUserData: json['shift_user_data'] == null
          ? null
          : ShiftUserData.fromJson(
              json['shift_user_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'last_login': instance.lastLogin,
      'is_superuser': instance.isSuperuser,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'is_staff': instance.isStaff,
      'is_active': instance.isActive,
      'date_joined': instance.dateJoined.toIso8601String(),
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'birthdate': instance.birthdate,
      'street': instance.street,
      'street_2': instance.street2,
      'postcode': instance.postcode,
      'city': instance.city,
      'country': instance.country,
      'preferred_language': instance.preferredLanguage,
      'share_owner': instance.shareOwner,
      'shift_user_data': instance.shiftUserData,
    };
