import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/data/impact_metrics.dart';

class ImpactMetricsModel extends ChangeNotifier {
  static const String impactMetricsPrefKey = "impactMetrics";
  ImpactMetrics? _impactMetrics;

  final AppConfig appConfig;

  void fetchImpactMetrics() async {
    final response =
        await http.get(Uri.parse(appConfig.apiUrl + "/impact-metrics"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      _impactMetrics = ImpactMetrics.fromJson(jsonDecode(response.body));
      if (_impactMetrics != null) {
        notifyListeners();
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load impact metrics');
    }
  }

  ImpactMetricsModel(this.appConfig) {
    fetchImpactMetrics();
  }

  ImpactMetrics? get impactMetrics {
    if (_impactMetrics == null) {
      //async fetch metrics - will notify listeners if successful and subscribers will fetch updated results
      fetchImpactMetrics();
    }
    return _impactMetrics;
  }
}
