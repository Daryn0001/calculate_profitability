import 'dart:ui';

import 'package:flutter/material.dart';

class TextBuilder {

  // ! create text
  static TextSpan getText({required text, size = 18.0, color = Colors.black}) {
    return TextSpan(
        text: text,
        style: TextStyle(color: color,
      fontSize: size, ));
  }

  // ! create text index
  static TextSpan getTextIndex({required text, size = 11.0, color = Colors.black}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFeatures: const [FontFeature.subscripts()]));
  }


}
