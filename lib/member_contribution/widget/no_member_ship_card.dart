import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';

import '../../wm_design.dart';

class NoMemberShipCard extends StatelessWidget {

  const NoMemberShipCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: WMDesign.defaultElevation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.money),
              title: Text(S.of(context).noMembership),
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
