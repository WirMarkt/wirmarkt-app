import 'package:flutter/foundation.dart';
import 'package:wir_markt/data/membership.dart';

class MembershipModel extends ChangeNotifier {
  Membership? _membership;

  /// An unmodifiable view of the items in the cart.
  Membership? get membership => _membership;

  void updateMembership(Membership? membership) {
    _membership = membership;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
