import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';

class PaymentInfoCard extends StatelessWidget {
  final String sepaIban;
  final String sepaAccountHolder;
  final bool signedSepaMandate;

  const PaymentInfoCard({
    required this.sepaIban,
    required this.sepaAccountHolder,
    required this.signedSepaMandate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var textTheme = themeData.textTheme;
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.money),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              signedSepaMandate
                  ? sepaAccountHolder
                  : S.of(context).sepaAccountMissing,
              style: textTheme.titleSmall!.copyWith(
                  color:
                      signedSepaMandate ? null : themeData.colorScheme.error),
            ),
          ),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text(
                S.of(context).iban,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 4.0),
              Text(
                sepaIban,
                style: textTheme.bodySmall,
              ),
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
        const SizedBox(height: 8),
      ],
    ));
  }

  void _launchAccountInBrowser() =>
      launchUrl(AppConfig.get().memberManagementUri,
          mode: LaunchMode.externalApplication);
}
