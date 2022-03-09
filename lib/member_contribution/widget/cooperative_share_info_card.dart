import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';


class CooperativeShareInfoCard extends StatelessWidget {
  final int shareCount;

  const CooperativeShareInfoCard({
    required this.shareCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              S.of(context).shareCountInfo(shareCount),
            ),
            subtitle: Text(
              S.of(context).takeOverMoreSharesMessage,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text(S.of(context).manage),
                onPressed: _launchAccountInBrowser,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ));

  void _launchAccountInBrowser() {
    launch(
      AppConfig.get().memberManagementUri,
      forceSafariVC: false,
    );
  }
}
