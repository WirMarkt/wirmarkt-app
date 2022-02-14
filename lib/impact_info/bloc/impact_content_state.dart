part of 'impact_content_bloc.dart';

class ImpactContentState extends Equatable {
  const ImpactContentState(
      {this.status = FetchStatus.uninitialized,
      this.impactContents = const []});

  @override
  List<Object?> get props => [status, impactContents];

  final FetchStatus status;
  final List<ImpactContent> impactContents;

  ImpactContentState copyWith({
    FetchStatus? status,
    List<ImpactContent>? impactContents,
  }) {
    return ImpactContentState(
      status: status ?? this.status,
      impactContents: impactContents ?? this.impactContents,
    );
  }
}
