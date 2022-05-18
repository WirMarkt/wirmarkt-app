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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image(image: FileImage(File(imagePath))),
              ),
            ),
          ))),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
              },
              child: Text(S.of(context).submit)),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
