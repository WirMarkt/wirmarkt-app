import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    const outerPadding = EdgeInsets.all(24.0);

    var logoWidget = Image.asset(
      "images/logo_${Theme.of(context).brightness.name}.png",
    );
    const formWidget = LoginForm();

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).logIn)),
      body: BlocProvider(create: (context) {
        return LoginBloc(
          authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
        );
      }, child: SafeArea(
        child: LayoutBuilder(builder: (BuildContext context, _) {
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            return SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(children: [
                  Padding(
                    padding: outerPadding,
                    child: logoWidget,
                  ),
                  const Padding(
                    padding: outerPadding,
                    child: formWidget,
                  ),
                ]));
          } else {
            return Row(children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: outerPadding,
                  child: logoWidget,
                ),
              ),
              const Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  child: Padding(
                    padding: outerPadding,
                    child: formWidget,
                  ),
                ),
              ),
            ]);
          }
        }),
      )),
    );
  }
}