import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication/bloc/authentication_bloc.dart';
import '../generated/l10n.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return PreferencesPageState();
  }
}

class PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).propertiesTitle)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(S.of(context).changeAccount,
                        style: textTheme.titleMedium),
                    OutlinedButton(
                      child: Text(S.of(context).logOut),
                      onPressed: () async {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested());
                      },
                    ),
                    SizedBox(height: 16),
                    Text(S.of(context).licences, style: textTheme.titleMedium),
                    OutlinedButton(
                      child: Text(S.of(context).viewLicenses + "..."),
                      onPressed: () async {
                        showLicensePage(
                          context: context,
                          applicationName: "",
                          applicationIcon: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.asset(
                                "images/logo_${Theme.of(context).brightness.name}.png"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
