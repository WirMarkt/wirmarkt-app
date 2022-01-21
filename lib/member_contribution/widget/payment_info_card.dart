import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';

import '../../wm_design.dart';

class PaymentInfoCard extends StatelessWidget {
  final String sepaIban;
  final String sepaAccountHolder;
  final bool signedSepaMandate;

  const PaymentInfoCard({
    required this.sepaIban,
    required this.sepaAccountHolder,
    required this.signedSepaMandate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Card(
        elevation: WMDesign.defaultElevation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.money),
              title: Text(sepaAccountHolder),
              isThreeLine: true,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).iban,
                    style: textTheme.caption,
                  ),
                  const SizedBox(height: 2.0),
                  FittedBox(
                      child: Text(
                    sepaIban,
                  )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (!signedSepaMandate) const Icon(Icons.report_problem),
                TextButton(
                  child: Text(S.of(context).manage),
                  onPressed: _launchAccountInBrowser,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ));
  }

  void _launchAccountInBrowser() {
    launch(
      AppConfig.get().memberManagementUri,
      forceSafariVC: false,
    );
  }
}
