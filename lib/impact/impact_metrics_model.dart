import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/data/impact_metrics.dart';

class ImpactMetricsModel extends ChangeNotifier {
  static const String impactMetricsPrefKey = "impactMetrics";
  ImpactMetrics? _impactMetrics;

  final AppConfig appConfig;

  Future<ImpactMetrics> fetchImpactMetrics() async {
    final response = await http.get(Uri.parse(appConfig.apiUrl + "/impactmetrics"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ImpactMetrics.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load impact metrics');
    }
  }

  ImpactMetricsModel(this.appConfig) {
    fetchImpactMetrics().then((value) {
      _impactMetrics = value;
      notifyListeners();
    });
  }

  ImpactMetrics? get impactMetrics => _impactMetrics;
}
