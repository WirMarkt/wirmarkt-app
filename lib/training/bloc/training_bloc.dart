import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';

import '../model/training.dart';
import '../repository/training_repository.dart';

part 'training_event.dart';

part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingRepository _trainingRepository;

  TrainingBloc({
    required TrainingRepository trainingRepository,
  })  : _trainingRepository = trainingRepository,
        super(const TrainingState()) {
    on<RefreshTraining>(_onRefreshTraining);
  }

  Future<void> _onRefreshTraining(
    RefreshTraining event,
    Emitter<TrainingState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      Training? training =
          await _trainingRepository.getTraining(name: event.trainingName);
      emit(state.copyWith(status: FetchStatus.completed, training: training));
    } on ApiException {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
