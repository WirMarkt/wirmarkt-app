import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:wir_markt/order/order.dart';

class OrderHistoryModel extends ChangeNotifier {
  final List<Order> _orders = [];

  UnmodifiableListView<Order> get orders => UnmodifiableListView(_orders);

  void updateOrders(List<Order> orders) {
    _orders.clear();
    _orders.addAll(orders);
    notifyListeners();
  }
}
