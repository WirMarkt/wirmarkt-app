import 'package:flutter/material.dart';
import 'package:wir_markt/data/data.dart';
import 'package:wir_markt/generated/l10n.dart';

import '../widget/cooperative_share_info_card.dart';

class ShareOwnerInfoColumn extends StatelessWidget {
  final User user;

  const ShareOwnerInfoColumn({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user.shareOwner != null)
          _ShareOwnershipInfo(user.shareOwner!.numShares),
      ],
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
