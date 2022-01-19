import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wir_markt/api/api.dart';
import 'package:wir_markt/data/app_config.dart';
import 'package:wir_markt/generated/l10n.dart';
import 'package:wir_markt/login/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
        children: [
          _UsernameInput(),
          const Padding(padding: formPadding),
          _PasswordInput(),
          const Padding(padding: formPadding),
          Row(
            children: [
              _LoginButton(),
              const Padding(padding: formPadding),
              _ResetPasswordButton(),
            ],
          ),
        ],
      ),
    );
  }
}

//TODO refactor to email
class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            //border: const OutlineInputBorder(),
            labelText: S.of(context).username,
            errorText:
                state.username.invalid ? S.of(context).invalidUsername : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            //border: const OutlineInputBorder(),
            labelText: S.of(context).password,
            errorText:
                state.password.invalid ? S.of(context).invalidPassword : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: Text(S.of(context).logIn),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        var username = state.username;
        return TextButton(
          key: const Key('loginForm_forgot_password_raisedButton'),
          child: Text(S.of(context).forgotPasswordLabel),
          onPressed: username.valid
              ? () => _launchResetPasswordInBrowser(username.value)
              : null,
        );
      },
    );
  }

  void _launchResetPasswordInBrowser(String username) {
    String _url = AppConfig.get()
        .passwordResetUri!
        .replace(queryParameters: {'email': username}).toString();
    launch(
      _url,
      forceSafariVC: false,
    );
  }
}
