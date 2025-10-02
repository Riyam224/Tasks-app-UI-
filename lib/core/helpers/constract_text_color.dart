import 'package:flutter/material.dart';

/// Returns black or white depending on background brightness
Color getContrastingTextColor(Color background) {
  return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
      ? Colors.white
      : Colors.black; // white for dark colors, black for light colors
}
