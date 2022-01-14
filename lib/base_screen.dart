import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wir_markt/auth/auth_model.dart';
import 'package:wir_markt/auth/login_page.dart';
import 'package:wir_markt/home/home_page.dart';

/// Base screen shows splash at beginning and home / login view, depending on authentication
/// It watches login state and shows login screen if necessary
/// It's always possible to navigate back here using
/// ```dart
/// Navigator.popUntil(context, ModalRoute.withName('/'));
/// ```
class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  bool _splashDone = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _splashDone = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_splashDone) {
      return buildSplash(context);
    } else {
      return Consumer<AuthModel>(builder: (context, authModel, _) {
        if (authModel.authenticated) {
          return const HomePage();
        } else {
          return LoginPage();
        }
      });
    }
  }

  Scaffold buildSplash(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset(
            "images/logo_${Theme.of(context).brightness.name}.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
