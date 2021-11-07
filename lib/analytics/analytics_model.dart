
import 'package:flutter/foundation.dart';
import 'package:wir_markt/analytics/analytics.dart';

class AnalyticsModel extends ChangeNotifier {
  Analytics? _analytics;

  /// An unmodifiable view of the items in the cart.
  Analytics? get analytics => _analytics;

  void updateAnalytics(Analytics? analytics) {
    _analytics = analytics;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}