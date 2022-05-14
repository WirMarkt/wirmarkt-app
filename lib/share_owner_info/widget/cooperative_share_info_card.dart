import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';

class CooperativeShareInfoCard extends StatelessWidget {
  final int shareCount;

  const CooperativeShareInfoCard({
    required this.shareCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.person),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              S.of(context).shareCountInfo(shareCount),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              S.of(context).takeOverMoreSharesMessage,
              style: Theme.of(context).textTheme.bodySmall,
            ),
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
  }

  void _launchAccountInBrowser() =>
      launchUrl(AppConfig.get().memberManagementUri,
          mode: LaunchMode.externalApplication);
}
