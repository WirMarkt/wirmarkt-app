import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/data/membership.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/home/onboarding_card.dart';
import 'package:wir_markt/home/wm_bottom_app_bar.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/membership/membership_validation_page.dart';
import 'package:wir_markt/scan/scan_page.dart';
import 'package:wir_markt/suggest_product/suggest_product_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        //TODO load membership from storage or backend
        Provider.of<MembershipModel>(context, listen: false)
            .updateMembership(Membership("qrcodestring"));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const paddingVertical = 16.0;
    Membership? _membership =
        Provider.of<MembershipModel>(context, listen: false).membership;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("WirMarkt"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: profileClicked,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: paddingVertical),
            OnboardingCard(
              title: S.of(context).createAssortmentSuggestionTitle,
              explanation: S.of(context).createAssortmentSuggestionExplanation,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SuggestProductPage(
                        title: S.of(context).createAssortmentSuggestionTitle),
                  ),
                );
              },
              iconImage: AssetImage("images/fridge.jpg"),
              //TODO this should be dynamic
              done: true,
            ),
            OnboardingCard(
              title: S.of(context).createProductSuggestionTitle,
              explanation: S.of(context).createProductSuggestionExplanation,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SuggestProductPage(
                        title: S.of(context).createProductSuggestionTitle),
                  ),
                );
              },
              iconImage: AssetImage("images/produce.jpg"),
              //TODO this should be dynamic
              done: false,
            ),
            if (_membership == null)
              OnboardingCard(
                title: S.of(context).setupMembershipTitle,
                explanation: S.of(context).setupMembershipExplanation,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SuggestProductPage(
                          title: S.of(context).setupMembershipTitle),
                    ),
                  );
                },
                iconImage: AssetImage("images/member-card.jpg"),
                //TODO this should be dynamic
                done: false,
              ),
            if (_membership != null)
              OnboardingCard(
                title: S.of(context).shopAsMemberTitle,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          MembershipValidationPage(
                              title: S.of(context).shopAsMemberTitle),
                    ),
                  );
                },
                //TODO this should be dynamic
                done: false,
                iconImage: AssetImage("images/orange-bag.jpg"),
              ),
            SizedBox(height: paddingVertical * 2),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToScan();
        },
        tooltip: 'Scan',
        child: Icon(Icons.qr_code_scanner),
        elevation: 2.0,
      ),
      bottomNavigationBar: WMBottomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
    );
  }

  void profileClicked() {}

  void _navigateToScan() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ScanPage(),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  final String title;
  final Widget child;

  const Headline(this.title, {Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 8.0, left: 4.0, right: 4.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: child,
        ),
      ],
    );
  }
}
