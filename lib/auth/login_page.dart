import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/auth/auth_model.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String?> attemptLogIn(String email, String password) async {
    if (AppConfig.get().staticJWT != null) return AppConfig.get().staticJWT;
    var res = await http.post(Uri.parse("${AppConfig.get().apiUrl}/login"),
        body: {"email": email, "password": password});
    if (res.statusCode == 200) return res.body;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    bool isScreenWide = orientation == Orientation.landscape;

    double? wideWidth =
        isScreenWide ? MediaQuery.of(context).size.width * 0.6 : null;

    const outerPadding = EdgeInsets.all(24.0);

    const formPadding = EdgeInsets.all(8.0);
    var imagePadding = EdgeInsets.all(isScreenWide ? 0.0 : 24.0);

    return Scaffold(
        appBar: AppBar(
          title: Text(AppConfig.get().orgName),
        ),
        body: Flex(
          direction: isScreenWide ? Axis.horizontal : Axis.vertical,
          children: <Widget>[
            //in landscape mode, this makes some space for editing on devices with non-rectangular shaped displays (e. g. iPhone 13)
            const SizedBox(width: 24),
            Flexible(
              child: Padding(
                padding: outerPadding,
                child: Padding(
                  padding: imagePadding,
                  child: Image.asset(
                    "images/logo_${Theme.of(context).brightness.name}.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: wideWidth,
              child: Padding(
                padding: outerPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: formPadding,
                      child: Text(
                        S.of(context).pleaseLogInToContinue,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: formPadding,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: S.of(context).email),
                      ),
                    ),
                    Padding(
                      padding: formPadding,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: S.of(context).password),
                      ),
                    ),
                    Padding(
                      padding: formPadding,
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                var email = _emailController.text;
                                var password = _passwordController.text;
                                var jwt = await attemptLogIn(email, password);
                                if (jwt != null) {
                                  Provider.of<AuthModel>(context, listen: false)
                                      .updateLogin(jwt);

                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/'));
                                } else {
                                  displayDialog(
                                      context,
                                      S.of(context).anErrorOccurred,
                                      S
                                          .of(context)
                                          .noAccountWasFoundMatchingThatEmailAndPassword);
                                }
                              },
                              child: Text(S.of(context).logIn)),
                          if (AppConfig.get().passwordResetUri != null)
                            TextButton(
                                onPressed: () async {
                                  _launchPasswordReset(_emailController.text);
                                },
                                child: Text(S.of(context).forgotPasswordLabel)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //in landscape mode, this makes some space for editing on devices with non-rectangular shaped displays (e. g. iPhone 13)
            const SizedBox(width: 24),
          ],
        ));
  }

  void _launchPasswordReset(String _email) async {
    String _url = AppConfig.get()
        .passwordResetUri!
        .replace(queryParameters: {'email': _email}).toString();
    if (!await launch(
      _url,
      forceSafariVC: false,
    )) throw 'Could not launch $_url';
  }
}
