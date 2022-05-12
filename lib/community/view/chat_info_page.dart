import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/authentication/widget/authenticated.dart';

import '../../data/data.dart';
import '../../generated/l10n.dart';

class ChatInfoPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ChatInfoPage());
  }

  @override
  Widget build(BuildContext context) {
    return Authenticated(
      onAuthenticated: (AuthenticationState state) {},
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("WirMarkt Chat",
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 16),
              Text(
                S.of(context).rocketChatIntro,
              ),
              SizedBox(height: 16),
              Text(
                S.of(context).passwordAndUsernameAreSame,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _launchChat();
                },
                child: Text(S.of(context).openChat),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchChat() => launchUrl(AppConfig.get().chatUri);
}
