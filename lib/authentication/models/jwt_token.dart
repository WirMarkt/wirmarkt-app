import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'jwt_token.g.dart';

@JsonSerializable()
@immutable
class JwtToken extends Equatable {
  static const JwtToken empty = JwtToken("");

  const JwtToken(this.accessToken, [this.refreshToken]);

  @JsonKey(name: "access")
  final String accessToken;
  @JsonKey(name: "refresh")
  final String? refreshToken;

  factory JwtToken.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenFromJson(json);

  bool get isNotExpired => !isExpired;

  int? get userId => userInfo['user_id'];

  Map<String, dynamic> toJson() => _$JwtTokenToJson(this);

  bool get isExpired => JwtDecoder.isExpired(accessToken);

  bool get hasValidRefreshToken =>
      refreshToken != null ? !JwtDecoder.isExpired(refreshToken!) : false;

  Duration get remainingTime => JwtDecoder.getRemainingTime(accessToken);

  Map<String, dynamic> get userInfo => JwtDecoder.tryDecode(accessToken) ?? {};

  @override
  List<Object?> get props => [accessToken, refreshToken];

  @override
  bool get stringify => true;
}
