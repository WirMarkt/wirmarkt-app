import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/analytics/analytics_model.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnalyticsPageState();
  }
}

class AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auswertung"),
      ),
      body: Consumer<AnalyticsModel>(
        builder: (context, AnalyticsModel analyticsModel, child) {
          return Column(
            children: [
              if(analyticsModel.analytics != null) PlanetaryBoundaryCard(
                numPlanets: analyticsModel.analytics!.planetaryBoundaryFactor,
              ),
            ],
          );
        },
      ),
    );
  }
}

class PlanetaryBoundaryCard extends StatelessWidget {
  final double numPlanets;

  const PlanetaryBoundaryCard({Key? key, required this.numPlanets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Planetare Möglichkeiten'),
              subtitle:
                  Text("Deine Ernährung entspricht $numPlanets Planeten."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Details zur Berechnung',
                  ),
                  onPressed: () {
                    //TODO browser öffnen
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
