

import 'package:equatable/equatable.dart';
import 'package:wir_markt/authentication/models/jwt_token.dart';

class MemberInfoEvent extends Equatable {
  const MemberInfoEvent();

  @override
  List<Object> get props => [];
}


class RefreshMemberInfo extends MemberInfoEvent {
  final JwtToken jwtToken;

  const RefreshMemberInfo(this.jwtToken);
}