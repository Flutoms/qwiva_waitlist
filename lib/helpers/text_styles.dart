import 'package:flutter/material.dart';
import 'size_config.dart';

class GlobalTextStyles {
  static TextStyle formatFigures({Color? color, double fontSize = 16}) {
    return TextStyle(
        fontWeight: FontWeight.w600, color: color, fontSize: fontSize);
  }

  static TextStyle regularText({Color? color, double fontSize = 16}) {
    return TextStyle(color: color, fontFamily: 'Regular', fontSize: fontSize);
  }

  static TextStyle medium({Color? color, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Medium',
        fontWeight: FontWeight.w600,
        fontSize: fontSize);
  }

  static TextStyle semiBold({Color? color, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Semibold',
        fontWeight: FontWeight.w600,
        fontSize: fontSize);
  }

  static TextStyle bold(
      {Color? color, Paint? foreground, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Bold',
        fontWeight: FontWeight.bold,
        foreground: foreground,
        fontSize: fontSize);
  }
}
