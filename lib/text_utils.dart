import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils {

  static const double textSize = 15, titleSize = 16, superTitleSIze = 21;

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

      style: GoogleFonts.nunito(
        fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
        fontStyle: italic? FontStyle.italic : FontStyle.normal,
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  static Text getTitle(String text) {
    return getText(text, fontSize: titleSize, bold:true, color: darkBlue, textAlign: TextAlign.left);
  }
}