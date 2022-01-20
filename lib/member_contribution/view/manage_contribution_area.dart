import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_contribution/bloc/member_contribution_bloc.dart';
import 'package:wir_markt/widgets/widgets.dart';

class ManageContributionArea extends StatelessWidget {
  const ManageContributionArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: SafeArea(
        child: BlocBuilder<MemberContributionBloc, MemberContributionState>(
            builder: (context, state) {
          switch (state.status) {
            case FetchStatus.uninitialized:
            case FetchStatus.loading:
              return Loading(
                  loadingMessage: S.of(context).loadingMembershipInfo);
            case FetchStatus.completed:
              if (state.memberContribution.nextShiftName != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text("Your next shift: \n"
                      "${state.memberContribution.nextShiftName}\n"
                      "at ${state.memberContribution.nextShiftStartTime}\n"),
                );
              } else if (state.memberContribution.isPaying == true) {
                return Center(
                    child: Text(
                        "We'll draw next amount from your account with IBAN: ${state.memberContribution.sepaIban}"));
              } else {
                return const Center(child: Text("No data"));
              }
            case FetchStatus.error:
              return ErrorDisplay(
                errorMessage: S.of(context).failedToLoadMembershipInfo,
                onRetryPressed: () {
                  var jwtToken =
                      context.read<AuthenticationBloc>().state.jwtToken;
                  context
                      .read<MemberContributionBloc>()
                      .add(RefreshMemberContribution(jwtToken));
                },
              );
          }
        }),
      ),
      onAuthenticated: (state) => context
          .read<MemberContributionBloc>()
          .add(RefreshMemberContribution(state.jwtToken)),
    );
  }
}
