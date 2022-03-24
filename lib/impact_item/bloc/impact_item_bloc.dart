import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../model/impact_item.dart';
import '../repository/impact_item_repository.dart';

part 'impact_item_event.dart';
part 'impact_item_state.dart';

class ImpactItemBloc extends Bloc<ImpactItemEvent, ImpactItemState> {
  final ImpactItemRepository _impactItemRepository;

  ImpactItemBloc({
    required ImpactItemRepository impactItemRepository,
  })  : _impactItemRepository = impactItemRepository,
        super(const ImpactItemState()) {
    on<RefreshImpactItem>(_onRefreshImpactItem);
  }

  Future<void> _onRefreshImpactItem(
    RefreshImpactItem event,
    Emitter<ImpactItemState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      List<ImpactItem>? contents = await _impactItemRepository.getImpactItems();
      emit(
          state.copyWith(status: FetchStatus.completed, impactItems: contents));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
