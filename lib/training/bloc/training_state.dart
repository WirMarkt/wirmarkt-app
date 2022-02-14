part of 'training_bloc.dart';

class TrainingState extends Equatable {
  const TrainingState(
      {this.status = FetchStatus.uninitialized,
      this.training = Training.empty});

  @override
  List<Object?> get props => [status, training];

  final FetchStatus status;
  final Training training;

  TrainingState copyWith({
    FetchStatus? status,
    Training? training,
  }) {
    return TrainingState(
      status: status ?? this.status,
      training: training ?? this.training,
    );
  }
}
