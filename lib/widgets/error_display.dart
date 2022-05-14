import 'package:flutter/material.dart';
import 'package:wir_markt/generated/l10n.dart';

class ErrorDisplay extends StatelessWidget {
  final String errorMessage;
  final void Function()? onRetryPressed;

  const ErrorDisplay(
      {super.key, required this.errorMessage, this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: Text(
              S.of(context).retry,
            ),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
