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
            errorText:
            state.username.invalid ? S.of(context).invalidUsername : null,
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
            errorText:
            state.password.invalid ? S.of(context).invalidPassword : null,
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
