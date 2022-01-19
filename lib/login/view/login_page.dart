import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wir_markt/authentication/authentication.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/login/login.dart';
import 'package:wir_markt/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    const outerPadding = EdgeInsets.all(24.0);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).logIn)),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: OrientationBasedFlex(
            children: [
              Expanded(
                child: Padding(
                  padding: outerPadding,
                  child: Image.asset(
                    "images/logo_${Theme.of(context).brightness.name}.png",
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: outerPadding,
                  child: LoginForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}