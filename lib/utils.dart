import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  //apply 50% lightness (so we get whole spectrum of lightness)
  Color baseColor = HSLColor.fromColor(color).withLightness(0.50).toColor();

  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = baseColor.red, g = baseColor.green, b = baseColor.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(baseColor.value, swatch);
}
