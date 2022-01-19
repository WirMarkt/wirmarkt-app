part of 'member_info_bloc.dart';

class MemberInfoState extends Equatable {
  const MemberInfoState(
      {this.status = FetchStatus.uninitialized, this.memberInfo = MemberInfo.empty});

  @override
  List<Object?> get props => [status, memberInfo];

  final FetchStatus status;
  final MemberInfo memberInfo;

  MemberInfoState copyWith({
    FetchStatus? status,
    MemberInfo? memberInfo,
  }) {
    return MemberInfoState(
      status: status ?? this.status,
      memberInfo: memberInfo ?? this.memberInfo,
    );
  }

}
