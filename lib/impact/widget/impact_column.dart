
import 'package:flutter/material.dart';
import 'package:wir_markt/generated/l10n.dart';

import 'impact_card.dart';

class ImpactColumn extends StatelessWidget {
  const ImpactColumn({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;

    return Column(
      children: [
        const SizedBox(height: paddingVertical),
        // if (impactMetrics.impactMetrics != null)
        //   ImpactCard(
        //     title: S.of(context).membershipCountTitle(
        //         impactMetrics.impactMetrics!.memberCount),
        //     explanation: S.of(context).membershipCountExplanation,
        //     image: const AssetImage("images/bird.jpg"),
        //     backgroundColor: const Color.fromRGBO(189, 231, 221, 1),
        //     textColor: Colors.black,
        //   ),
        // if (impactMetrics.impactMetrics != null)
        //   ImpactCard(
        //     title: S
        //         .of(context)
        //         .storeCountTitle(impactMetrics.impactMetrics!.storeCount),
        //     explanation: S.of(context).storeCountExplanation,
        //     image: const AssetImage("images/peas.jpg"),
        //     backgroundColor: const Color.fromRGBO(250, 231, 214, 1),
        //     textColor: Colors.black,
        //   ),
        ImpactCard(
          title: S.of(context).regionalwertPartnerTitle,
          explanation: S.of(context).regionalwertPartnerExplanation,
          image: const AssetImage("images/regionalwert-partner.webp"),
          backgroundColor: const Color.fromRGBO(167, 223, 210, 1),
          textColor: Colors.black,
        ),
        const SizedBox(height: paddingVertical * 2),
      ],
    );
  }
}