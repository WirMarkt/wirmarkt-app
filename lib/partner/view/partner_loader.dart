import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/utils/fetch_status.dart';
import '../../generated/l10n.dart';
import '../../widgets/colored_progress_indicator.dart';
import '../../widgets/error_display.dart';
import '../bloc/partner_bloc.dart';
import 'partner_list_view.dart';

class PartnerLoader extends StatefulWidget {
  const PartnerLoader({super.key});

  @override
  State<PartnerLoader> createState() => _PartnerLoaderState();
}

class _PartnerLoaderState extends State<PartnerLoader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerBloc, PartnerState>(
      builder: (context, state) {
        switch (state.status) {
          case FetchStatus.uninitialized:
          case FetchStatus.loading:
            return ColoredProgressIndicator();
          case FetchStatus.completed:
            return PartnerListView(partners: state.partners);
          case FetchStatus.error:
            return ErrorDisplay(
              errorMessage: S.of(context).failedToLoadImpactInfoMessage,
              onRetryPressed: () {
                _refreshPartner();
              },
            );
        }
      },
    );
  }

  void _refreshPartner() {
    context.read<PartnerBloc>().add(const RefreshPartner());
  }

  @override
  void initState() {
    super.initState();

    _refreshPartner();
  }
}
