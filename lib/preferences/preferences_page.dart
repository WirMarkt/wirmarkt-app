import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/generated/l10n.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PreferencesPageState();
  }
}

class PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).propertiesTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                child: Text(S.of(context).logOut),
                onPressed: () async {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
