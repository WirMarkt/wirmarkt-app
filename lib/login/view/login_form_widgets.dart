part of 'login_form.dart';

class _UsernameInput extends StatefulWidget {
  @override
  State<_UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<_UsernameInput> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          autocorrect: false,
          controller: textController,
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            //border: const OutlineInputBorder(),
            labelText: S.of(context).username,
            errorText: state.username.isNotValid && !state.username.isPure
                ? S.of(context).invalidUsername
                : null,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    textController.text = context.read<LoginBloc>().state.username.value;
  }
}

class _PasswordInput extends StatefulWidget {
  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          autocorrect: false,
          controller: textController,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            //border: const OutlineInputBorder(),
            labelText: S.of(context).password,
            errorText: state.password.isNotValid && !state.password.isPure
                ? S.of(context).invalidPassword
                : null,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    textController.text = context.read<LoginBloc>().state.password.value;
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.validated != current.validated ||
          previous.submissionStatus != current.submissionStatus,
      builder: (context, state) {
        return state.submissionStatus == FormzSubmissionStatus.inProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: Text(S.of(context).logIn),
                onPressed: state.validated
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
          onPressed: username.isValid
              ? () => _launchResetPasswordInBrowser()
              : null,
        );
      },
    );
  }

  void _launchResetPasswordInBrowser([String email = ""]) => launchUrl(
      AppConfig.get()
          .passwordResetUri
          .replace(queryParameters: {'email': email}),
      mode: LaunchMode.inAppWebView);
}

class _ApplyForMembershipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_apply_for_membership_raisedButton'),
      child: Text(S.of(context).applyForMembershipLabel),
      onPressed: _launchApplyForMembershipInBrowser,
    );
  }

  void _launchApplyForMembershipInBrowser() =>
      launchUrl(AppConfig.get().applyForMembershipUri,
          mode: LaunchMode.inAppWebView);
}
