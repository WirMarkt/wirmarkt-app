import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication.dart';

class Authenticated extends StatefulWidget {
  final Widget child;

  final void Function(AuthenticationState state) onAuthenticated;

  const Authenticated(
      {required this.child, required this.onAuthenticated, super.key});

  @override
  State<Authenticated> createState() => _AuthenticatedState();
}

class _AuthenticatedState extends State<Authenticated> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          _checkState(state, context);
        },
        child: widget.child);
  }

  void _checkState(AuthenticationState state, BuildContext context) {
    if (state.status == AuthenticationStatus.authenticated) {
      if (state.jwtToken.isExpired) {
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationRefreshRequested());
      } else {
        widget.onAuthenticated(state);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _checkState(context.read<AuthenticationBloc>().state, context);
  }
}
