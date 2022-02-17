import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../generated/l10n.dart';
import '../../widgets/error_display.dart';
import '../../widgets/loading.dart';
import '../bloc/training_bloc.dart';
import 'training_view.dart';

class TrainingLoader extends StatefulWidget {
  final String trainingName;

  const TrainingLoader(this.trainingName, {Key? key}) : super(key: key);

  @override
  State<TrainingLoader> createState() => _TrainingLoaderState();
}

class _TrainingLoaderState extends State<TrainingLoader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        switch (state.status) {
          case FetchStatus.uninitialized:
          case FetchStatus.loading:
            return Loading(
                loadingMessage: S.of(context).loadingTrainingMessage);
          case FetchStatus.completed:
            return TrainingView(training: state.training);
          case FetchStatus.error:
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadTrainingContentMessage,
              onRetryPressed: () {
                _refreshTraining();
              },
            );
        }
      },
    );
  }

  void _refreshTraining() {
    context.read<TrainingBloc>().add(RefreshTraining(widget.trainingName));
  }

  @override
  void initState() {
    super.initState();

    _refreshTraining();
  }
}
