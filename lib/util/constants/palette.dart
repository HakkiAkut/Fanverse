import 'dart:math';

import 'package:flutter/material.dart';

class Palette {
  static const MAIN_COLOR = Colors.orange;
  static const BOLD_COLOR = Color(0xFFE65100);
  static const GRADIENT_COLOR = [Colors.deepOrangeAccent, Colors.deepOrange];
  static const PROFILE_GRADIENT = [Colors.white, Colors.grey];

  static Color getRandomColor() {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.deepPurple,
      Colors.pink,
      Colors.amberAccent,
      Colors.lightGreen
    ];
    return colors[Random().nextInt(colors.length)];
  }
}
