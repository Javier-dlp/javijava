import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextUtils {

  static const double textSize = 14, titleSize = 16, superTitleSIze = 20;

  static Color darkBlue = Colors.lightBlue.shade800;

  static Text getText(String text, {
    double fontSize = textSize,
    bool bold = false,
    bool italic = false,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.left
  }) {
    return Text(
      text,
      textAlign: textAlign,

      style: TextStyle(
        fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
        fontStyle: italic? FontStyle.italic : FontStyle.normal,
        color: color,
        fontSize: fontSize,
      )
    );
  }

  static Text getTitle(String text) {
    return getText(text, fontSize: titleSize, bold:true, color: darkBlue, textAlign: TextAlign.left);
  }
}