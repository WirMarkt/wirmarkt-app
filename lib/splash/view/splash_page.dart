import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Image.asset(
              "images/logo_${Theme.of(context).brightness.name}.png",
              fit: BoxFit.cover,
            ),
          ),
          const CircularProgressIndicator(),
        ],
      )),
    );
  }
}
