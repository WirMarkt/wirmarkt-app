
import 'package:flutter/material.dart';

class SuggestProductPage extends StatelessWidget {
  final String title;

  const SuggestProductPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
    );
  }
}
