import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/data/membership.dart';

class MembershipModel extends ChangeNotifier {
  static const String membershipPrefKey = "membership";
  Membership? _membership;

  MembershipModel() {
    if (AppConfig.get().staticMembershipID != null) {
      updateMembership(Membership(AppConfig.get().staticMembershipID!));
    } else {
      SharedPreferences.getInstance().then((prefs) {
        var membershipJsonString = prefs.getString(membershipPrefKey);
        if (membershipJsonString != null) {
          updateMembership(
              Membership.fromJson(jsonDecode(membershipJsonString)));
        } else {
          updateMembership(null);
        }
      });
    }
  }

  Membership? get membership => _membership;

  void updateMembership(Membership? membership) async {
    _membership = membership;

    SharedPreferences.getInstance().then((prefs) {
      if (membership != null) {
        prefs.setString(membershipPrefKey, jsonEncode(membership.toJson()));
      } else {
        prefs.remove(membershipPrefKey);
      }
    });

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
