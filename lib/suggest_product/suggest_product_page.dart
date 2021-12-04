import 'package:flutter/material.dart';

//TODO create step-by-step UI to submit a product suggestion
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
