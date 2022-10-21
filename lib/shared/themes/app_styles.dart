import 'package:flutter/material.dart';

enum TypeFont { monospaceRegular }

abstract class AppTextStyles {
  TextStyle styleText(
      TypeFont typeFont, Color color, double size, FontWeight fontWeight);
}

class AppTextStyleTheme implements AppTextStyles {
  @override
  TextStyle styleText(
    TypeFont typeFont,
    Color color,
    double size,
    FontWeight fontWeight,
  ) {
    switch (typeFont) {
      case TypeFont.monospaceRegular:
        return TextStyle(
            fontFamily: 'joystix.monospace-regular',
            fontWeight: fontWeight,
            fontSize: size,
            color: color);
    }
  }
}
