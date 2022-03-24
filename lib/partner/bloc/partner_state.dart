part of 'partner_bloc.dart';

class PartnerState extends Equatable {
  const PartnerState(
      {this.status = FetchStatus.uninitialized, this.partners = const []});

  @override
  List<Object?> get props => [status, partners];

  final FetchStatus status;
  final List<Partner> partners;

  PartnerState copyWith({
    FetchStatus? status,
    List<Partner>? partners,
  }) {
    return PartnerState(
      status: status ?? this.status,
      partners: partners ?? this.partners,
    );
  }
}
