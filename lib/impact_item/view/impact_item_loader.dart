import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../generated/l10n.dart';
import '../../widgets/colored_progress_indicator.dart';
import '../../widgets/error_display.dart';
import '../bloc/impact_item_bloc.dart';
import 'impact_item_list_view.dart';

class ImpactItemLoader extends StatefulWidget {
  const ImpactItemLoader({Key? key}) : super(key: key);

  @override
  State<ImpactItemLoader> createState() => _ImpactItemLoaderState();
}

class _ImpactItemLoaderState extends State<ImpactItemLoader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImpactItemBloc, ImpactItemState>(
      builder: (context, state) {
        switch (state.status) {
          case FetchStatus.uninitialized:
          case FetchStatus.loading:
            return ColoredProgressIndicator();
          case FetchStatus.completed:
            return ImpactItemListView(impactItems: state.impactItems);
          case FetchStatus.error:
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadImpactInfoMessage,
              onRetryPressed: () {
                _refreshImpactItem();
              },
            );
        }
      },
    );
  }

  void _refreshImpactItem() {
    context.read<ImpactItemBloc>().add(const RefreshImpactItem());
  }

  @override
  void initState() {
    super.initState();

    _refreshImpactItem();
  }
}
