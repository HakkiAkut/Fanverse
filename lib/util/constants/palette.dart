import 'dart:math';

import 'package:flutter/material.dart';

class Palette {
  static const MAIN_COLOR = Colors.orange;
  static const BACKGROUND = Colors.white;
  static const BOLD_COLOR = Color(0xFFE65100);
  static const GRADIENT_COLOR = [Colors.deepOrangeAccent, Colors.deepOrange];
  static const PROFILE_GRADIENT = [Colors.white, Colors.grey];
  static const TEXT_COLOR = Colors.black;

  static const DARK_MAIN_COLOR = Colors.black45;
  static const DARK_TEXT_COLOR = Colors.white;
  static const DARK_BOLD_COLOR = Colors.black;
  static const DARK_GRADIENT_COLOR = [Colors.black, Colors.black12];
  static const DARK_BACKGROUND = Colors.black38;

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

  static Color getMainColor(bool isDarkMode) {
    return isDarkMode ? DARK_MAIN_COLOR : MAIN_COLOR;
  }

  static Color getTextColor(bool isDarkMode) {
    return isDarkMode ? DARK_TEXT_COLOR : TEXT_COLOR;
  }

  static List<Color> getGradientColor(bool isDarkMode) {
    return isDarkMode ? DARK_GRADIENT_COLOR : GRADIENT_COLOR;
  }
  static Color getBackground(bool isDarkMode) {
    return isDarkMode ? DARK_BACKGROUND : BACKGROUND;
  }
  static Color getBoldColor(bool isDarkMode) {
    return isDarkMode ? DARK_BOLD_COLOR : BOLD_COLOR;
  }
  static Color getTabLayoutColor(bool isDarkMode) {
    return isDarkMode ? DARK_TEXT_COLOR : BOLD_COLOR;
  }
  static Color getProfileBackground(bool isDarkMode) {
    return isDarkMode ? DARK_BACKGROUND : MAIN_COLOR.shade900;
  }
}
