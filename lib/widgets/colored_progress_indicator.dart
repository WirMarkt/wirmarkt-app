import 'package:flutter/material.dart';
import 'package:wir_markt/wm_design.dart';

class ColoredProgressIndicator extends StatelessWidget {
  const ColoredProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightGreen),
    );
  }
}
