part of 'impact_item_bloc.dart';

class ImpactItemState extends Equatable {
  const ImpactItemState(
      {this.status = FetchStatus.uninitialized, this.impactItems = const []});

  @override
  List<Object?> get props => [status, impactItems];

  final FetchStatus status;
  final List<ImpactItem> impactItems;

  ImpactItemState copyWith({
    FetchStatus? status,
    List<ImpactItem>? impactItems,
  }) {
    return ImpactItemState(
      status: status ?? this.status,
      impactItems: impactItems ?? this.impactItems,
    );
  }
}
