import 'dart:io';

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../home/view/home_page.dart';

class ReviewProductSuggestionPage extends StatelessWidget {
  final String imagePath;

  const ReviewProductSuggestionPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).submitSuggestion)),
      body: Column(
        children: [
          Image(image: FileImage(File(imagePath))),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
              },
              child: Text(S.of(context).submit))
        ],
      ),
    );
  }
}
