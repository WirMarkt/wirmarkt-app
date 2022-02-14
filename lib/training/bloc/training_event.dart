part of 'training_bloc.dart';

class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object> get props => [];
}

class RefreshTraining extends TrainingEvent {
  final String trainingName;

  const RefreshTraining(this.trainingName);
}
