import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../generated/l10n.dart';
import '../../widgets/error_display.dart';
import '../../widgets/loading.dart';
import '../bloc/impact_content_bloc.dart';
import 'impact_content_list_view.dart';

class ImpactContentLoader extends StatefulWidget {
  const ImpactContentLoader({Key? key}) : super(key: key);

  @override
  State<ImpactContentLoader> createState() => _ImpactContentLoaderState();
}

class _ImpactContentLoaderState extends State<ImpactContentLoader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImpactContentBloc, ImpactContentState>(
      builder: (context, state) {
        switch (state.status) {
          case FetchStatus.uninitialized:
          case FetchStatus.loading:
            return Loading(
                loadingMessage: S.of(context).loadingImpactMessage);
          case FetchStatus.completed:
            return ImpactContentListView(impactContents: state.impactContents);
          case FetchStatus.error:
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadImpactInfoMessage,
              onRetryPressed: () {
                _refreshImpactContent();
              },
            );
        }
      },
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
