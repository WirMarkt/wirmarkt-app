import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wir_markt/data/app_config.dart';

class AuthModel extends ChangeNotifier {
  static const String _jwtKey = "jwt";
  String? _jwt;
  final _storage = const FlutterSecureStorage();

  AuthModel() {
    if (AppConfig.get().staticJWT != null) {
      updateLogin(AppConfig.get().staticJWT!);
    } else {
      _storage.read(key: _jwtKey).then((storedJWT) {
        if (storedJWT != null) {
          updateLogin(storedJWT);
        } else {
          updateLogin(null);
        }
      });
    }
  }

  String? get jwt => _jwt;

  bool get authenticated => jwt != null;

  void updateLogin(String? jwt) async {
    //TODO validate JWT - could be done outside of here in a separate provider?

    _jwt = jwt;
    _storage.write(key: _jwtKey, value: jwt);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void logout() => updateLogin(null);
}
