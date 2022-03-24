import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../model/partner.dart';
import '../repository/partner_repository.dart';

part 'partner_event.dart';
part 'partner_state.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  final PartnerRepository _partnerRepository;

  PartnerBloc({
    required PartnerRepository partnerRepository,
  })  : _partnerRepository = partnerRepository,
        super(const PartnerState()) {
    on<RefreshPartner>(_onRefreshPartner);
  }

  Future<void> _onRefreshPartner(
    RefreshPartner event,
    Emitter<PartnerState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      List<Partner>? contents = await _partnerRepository.getPartners();
      emit(state.copyWith(status: FetchStatus.completed, partners: contents));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
