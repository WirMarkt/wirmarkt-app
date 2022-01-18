import 'package:equatable/equatable.dart';
import 'package:wir_markt/api/utils/status.dart';
import 'package:wir_markt/member_info/model/member_info.dart';


class MemberInfoState extends Equatable {
  const MemberInfoState(
      {this.status = Status.uninitialized, this.memberInfo = MemberInfo.empty});

  @override
  List<Object?> get props => [status, memberInfo];

  final Status status;
  final MemberInfo memberInfo;

  MemberInfoState copyWith({
    Status? status,
    MemberInfo? memberInfo,
  }) {
    return MemberInfoState(
      status: status ?? this.status,
      memberInfo: memberInfo ?? this.memberInfo,
    );
  }

}
