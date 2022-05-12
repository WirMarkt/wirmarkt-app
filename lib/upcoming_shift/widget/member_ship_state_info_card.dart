import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';

//TODO move somewhere useful?
class MemberShipStateInfoCard extends StatelessWidget {
  final String memberShipStateMessage;

  const MemberShipStateInfoCard(
    this.memberShipStateMessage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.info),
          title: Text(memberShipStateMessage),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Icon(Icons.report_problem),
            TextButton(
              child: Text(S.of(context).manage),
              onPressed: _launchAccountInBrowser,
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 8),
      ],
    ));
  }

  void _launchAccountInBrowser() =>
      launchUrl(AppConfig.get().memberManagementUri);
}
