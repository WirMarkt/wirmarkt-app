import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/member_contribution/bloc/member_contribution_bloc.dart';
import 'package:wir_markt/member_contribution/model/member_contribution.dart';
import 'package:wir_markt/member_contribution/widget/member_ship_state_info_card.dart';
import 'package:wir_markt/member_contribution/widget/payment_info_card.dart';
import 'package:wir_markt/member_contribution/widget/shift_card.dart';
import 'package:wir_markt/widgets/widgets.dart';

import '../widget/cooperative_share_info_card.dart';

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
              return Column(children: [
                _createShiftOrPaymentInfo(state, context),
                _ShareOwnershipInfo(state.memberContribution.shareCount),
              ]);
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

  Widget _createShiftOrPaymentInfo(
      MemberContributionState state, BuildContext context) {
    /*TODO if (state.memberContribution.isPaying == true) {
      return _PaymentInfoPanel(state.memberContribution);
    } else*/ if (state.memberContribution.status == MemberStatus.active) {
      if (state.memberContribution.nextShiftName != null) {
        return _NextShiftPanel(state.memberContribution);
      } else {
        return _ManageMemberShipPanel(S.of(context).noUpcomingShift);
      }
    } else {
      return _ManageMemberShipPanel(S.of(context).noMembership);
    }
  }
}

@immutable
class _NextShiftPanel extends StatelessWidget {
  final MemberContribution memberContribution;

  const _NextShiftPanel(
    this.memberContribution, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).contribution,
            style: textTheme.headline6,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            S.of(context).workingModeExplanation,
            style: textTheme.bodyText1,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            S.of(context).upcomingShift,
            style: textTheme.subtitle1,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          ShiftCard(
            shiftName: memberContribution.nextShiftName!,
            shiftStart: memberContribution.nextShiftStartTime!,
            shiftEnd: memberContribution.nextShiftEndTime!,
            shiftUrl: memberContribution.nextShiftUrl!,
            shiftState: memberContribution.nextShiftAttendanceState!,
          ),
        ],
      ),
    );
  }
}

@immutable
class _PaymentInfoPanel extends StatelessWidget {
  final MemberContribution memberContribution;

  const _PaymentInfoPanel(
    this.memberContribution, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).fee,
            style: textTheme.headline6,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            S.of(context).payingModeExplanation,
            style: textTheme.bodyText1,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            S.of(context).yourAccountDetails,
            style: textTheme.subtitle1,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          PaymentInfoCard(
            sepaIban: memberContribution.sepaIban!,
            sepaAccountHolder: memberContribution.sepaAccountHolder!,
            signedSepaMandate: memberContribution.signedSepaMandate!,
          ),
        ],
      ),
    );
  }
}

@immutable
class _ManageMemberShipPanel extends StatelessWidget {
  final String memberShipStateMessage;

  const _ManageMemberShipPanel(this.memberShipStateMessage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S
                .of(context)
                .manageMembership,
            style: Theme
                .of(context)
                .textTheme
                .headline6,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          MemberShipStateInfoCard(memberShipStateMessage),
        ],
      ),
    );
  }
}

@immutable
class _ShareOwnershipInfo extends StatelessWidget {
  final int shareCount;

  const _ShareOwnershipInfo(this.shareCount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).cooperativeSharesHeadline,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          CooperativeShareInfoCard(shareCount: shareCount),
        ],
      ),
    );
  }
}