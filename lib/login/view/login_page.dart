import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/repository/authentication_repository.dart';
import '../../generated/l10n.dart';
import '../bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    const outerPadding = EdgeInsets.all(24.0);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).logIn)),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          );
        },
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 350,
              ),
              child: Column(children: [
                Padding(
                  padding: outerPadding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 200,
                    ),
                    child: Image.asset(
                      "images/logo_${Theme.of(context).brightness.name}.png",
                    ),
                  ),
                ),
                const Padding(
                  padding: outerPadding,
                  child: LoginForm(),
                ),
              ]),
            ),
          ),
        )),
      ),
    );
  }
}
