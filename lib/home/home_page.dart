import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/analytics/analytics.dart';
import 'package:wir_markt/analytics/analytics_model.dart';
import 'package:wir_markt/analytics/analytics_page.dart';
import 'package:wir_markt/data/membership.dart';
import 'package:wir_markt/membership/membership_model.dart';
import 'package:wir_markt/membership/membership_page.dart';
import 'package:wir_markt/membership/membership_validation_page.dart';
import 'package:wir_markt/order/order.dart';
import 'package:wir_markt/order/order_history_model.dart';
import 'package:wir_markt/scan/scan_page.dart';

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
        Provider.of<MembershipModel>(context, listen: false).updateMembership(
            Membership("Demo 2", "Fab", "fabian@wirmarkt.org"));
        Provider.of<OrderHistoryModel>(context, listen: false)
            .updateOrders([Order(123.3, DateTime(2021, 3, 3, 4))]);
        Provider.of<AnalyticsModel>(context, listen: false)
            .updateAnalytics(Analytics(1.3));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("WirMarkt"),
        flexibleSpace: Opacity(
          opacity: 0.8,
          child: Image(
            image: AssetImage('images/pumpkins.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: profileClicked,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/pumpkins.jpg"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Center(
                child: Image(
                  image: AssetImage('images/wirmarkt-logo.jpg'),
                  fit: BoxFit.fitWidth,
                  width: 100,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Einkäufe'),
              onTap: () {
                //close drawer
                Navigator.of(context).pop();

                _navigateToOrderList();
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Auswertung'),
              onTap: () {
                //close drawer
                Navigator.of(context).pop();
                _navigateToAnalytics();
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mitgliedschaft'),
              onTap: () {
                //close drawer
                Navigator.of(context).pop();
                _navigateToMembership();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Einstellungen'),
              onTap: () {
                //close drawer
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<OrderHistoryModel>(
          builder: (context, orderHistoryModel, child) {
            return Column(
              children: [
                const MembershipCard(),
                if (orderHistoryModel.orders.isNotEmpty)
                  RecentBuyCard(order: orderHistoryModel.orders.first),
              ],
            );
          },
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

  void _navigateToOrderList() {}

  void _navigateToAnalytics() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => AnalyticsPage(),
      ),
    );
  }

  void _navigateToMembership() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MembershipPage(),
      ),
    );
  }

  void _navigateToScan() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ScanPage(),
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  const MembershipCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Membership? _membership =
        Provider.of<MembershipModel>(context, listen: false).membership;

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Mitgliedschaft'),
              subtitle: Text(_membership == null
                  ? 'Du bist kein Mitglied.'
                  : 'Du bist Mitglied.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (_membership != null)
                  TextButton(
                    child: const Text(
                      'Verwalten',
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => MembershipPage(),
                        ),
                      );
                    },
                  ),
                const SizedBox(width: 8),
                if (_membership != null)
                  TextButton(
                    child: const Text(
                      'ID zeigen',
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              MembershipValidationPage(),
                        ),
                      );
                    },
                  ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecentBuyCard extends StatelessWidget {
  final Order order;

  const RecentBuyCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.shopping_bag_rounded),
              title: Text('Letzter Einkauf'),
              subtitle: Text('Für ${order.total} am ${order.date}.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Ansehen'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WMBottomAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WMBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.centerDocked,
    this.shape = const CircularNotchedRectangle(),
    required this.scaffoldKey,
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  State<WMBottomAppBar> createState() => _WMBottomAppBarState();
}

class _WMBottomAppBarState extends State<WMBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: widget.shape,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  widget.scaffoldKey.currentState!.openDrawer();
                });
              },
            ),
            if (WMBottomAppBar.centerLocations.contains(widget.fabLocation))
              const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
