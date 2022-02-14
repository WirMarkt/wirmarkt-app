import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../model/impact_content.dart';
import '../repository/impact_content_repository.dart';

part 'impact_content_event.dart';
part 'impact_content_state.dart';

class ImpactContentBloc extends Bloc<ImpactContentEvent, ImpactContentState> {
  final ImpactContentRepository _impactContentRepository;

  ImpactContentBloc({
    required ImpactContentRepository impactContentRepository,
  })  : _impactContentRepository = impactContentRepository,
        super(const ImpactContentState()) {
    on<RefreshImpactContent>(_onRefreshImpactContent);
  }

  Future<void> _onRefreshImpactContent(
    RefreshImpactContent event,
    Emitter<ImpactContentState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      List<ImpactContent>? contents =
          await _impactContentRepository.getImpactContents();
      emit(state.copyWith(
          status: FetchStatus.completed, impactContents: contents));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
