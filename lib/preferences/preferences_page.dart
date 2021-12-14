import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/membership/membership_model.dart';

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
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance()
          .then((prefs) => prefs.getKeys().isNotEmpty),
      builder: (BuildContext context, AsyncSnapshot<bool> hasSettingsSnap) {
        var hasSettings =
            hasSettingsSnap.hasData && hasSettingsSnap.data == true;
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).propertiesTitle)),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: ElevatedButton(
                    child: Text(S.of(context).resetAppLabel),
                    onPressed: !hasSettings
                        ? null
                        : () async {
                            var prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            setState(() {
                              Provider.of<MembershipModel>(context,
                                      listen: false)
                                  .updateMembership(null);
                            });
                          },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
