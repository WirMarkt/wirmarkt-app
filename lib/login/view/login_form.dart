import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/login/login.dart';

part 'login_form_widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    const formPadding = EdgeInsets.all(8.0);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          String reasonFailed;
          if (state.apiExceptionType == ApiExceptionType.connectionFailed) {
            reasonFailed = S.of(context).connectionFailed;
          } else {
            reasonFailed = S.of(context).authenticationFailure;
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                  content: Text(
                reasonFailed,
                textAlign: TextAlign.center,
              )),
            );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UsernameInput(),
          const Padding(padding: formPadding),
          _PasswordInput(),
          const Padding(padding: formPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _LoginButton(),
                const Padding(padding: formPadding),
                _ResetPasswordButton(),
              ],
            ),
          ),
          _ApplyForMembershipButton(),
        ],
      ),
    );
  }
}
