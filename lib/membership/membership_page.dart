import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/membership/membership_model.dart';

class MembershipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MembershipPageState();
  }
}

class MembershipPageState extends State<MembershipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deine Mitgliedschaft"),
      ),
      body: Consumer<MembershipModel>(
        builder: (context, MembershipModel membershipModel, child) {
          var _membership = membershipModel.membership;
          if (_membership != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(membershipModel.membership!.name,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(membershipModel.membership!.email,
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              ],
            );
          } else {
            return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => MembershipPage(),
                    ),
                  );
                },
                child: Text("Mitglied werden"));
          }
        },
      ),
    );
  }
}
