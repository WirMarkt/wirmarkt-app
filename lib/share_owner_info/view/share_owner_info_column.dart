import 'package:flutter/material.dart';
import 'package:wir_markt/data/data.dart';
import 'package:wir_markt/generated/l10n.dart';

import '../widget/cooperative_share_info_card.dart';
import '../widget/payment_info_card.dart';

class ShareOwnerInfoColumn extends StatelessWidget {
  final TapirUser tapirUser;

  const ShareOwnerInfoColumn({
    Key? key,
    required this.tapirUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: orientation == Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              if (tapirUser.shareOwner != null)
                _ShareOwnershipInfo(tapirUser.shareOwner!.numShares),
              if (tapirUser.shareOwner != null)
                _BankAccountInfoPanel(tapirUser.shareOwner!),
            ],
          );
        },
      ),
    );
  }
}

@immutable
class _BankAccountInfoPanel extends StatelessWidget {
  final ShareOwner shareOwner;

  const _BankAccountInfoPanel(
    this.shareOwner, {
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
            S.of(context).yourAccountDetails,
            style: textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16.0,
          ),
          PaymentInfoCard(
            sepaIban: shareOwner.sepaIban,
            sepaAccountHolder: shareOwner.sepaAccountHolder,
            signedSepaMandate: shareOwner.signedSepaMandate,
          ),
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
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16.0,
          ),
          CooperativeShareInfoCard(shareCount: shareCount),
        ],
      ),
    );
  }
}
