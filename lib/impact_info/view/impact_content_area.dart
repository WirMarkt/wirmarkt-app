import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../generated/l10n.dart';
import '../../widgets/error_display.dart';
import '../../widgets/loading.dart';
import '../bloc/impact_content_bloc.dart';
import 'impact_content_column.dart';

class ImpactContentArea extends StatefulWidget {
  const ImpactContentArea({Key? key}) : super(key: key);

  @override
  State<ImpactContentArea> createState() => _ImpactContentAreaState();
}

class _ImpactContentAreaState extends State<ImpactContentArea> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ImpactContentBloc, ImpactContentState>(
        builder: (context, state) {
          switch (state.status) {
            case FetchStatus.uninitialized:
            case FetchStatus.loading:
              return Loading(
                  loadingMessage: S.of(context).loadingImpactMessage);
            case FetchStatus.completed:
              return ImpactContentColumn(impactContents: state.impactContents);
            case FetchStatus.error:
              return ErrorDisplay(
                errorMessage: S.of(context).failedToLoadImpactInfoMessage,
                onRetryPressed: () {
                  _refreshImpactContent();
                },
              );
          }
        },
      ),
    );
  }

  void _refreshImpactContent() {
    context.read<ImpactContentBloc>().add(const RefreshImpactContent());
  }

  @override
  void initState() {
    super.initState();

    _refreshImpactContent();
  }
}
