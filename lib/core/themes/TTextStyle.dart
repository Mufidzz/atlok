import 'package:flutter/material.dart';

import 'TColors.dart';

class TTextStyle {
  static TextStyle smallest(
      {fontWeight = FontWeight.normal, color = TColors.primary}) {
    return new TextStyle(
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      color: color,
      fontSize: 9,
    );
  }

  static TextStyle small(
      {fontWeight = FontWeight.normal, color = TColors.primary}) {
    return new TextStyle(
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      color: color,
      fontSize: 10,
    );
  }

  static TextStyle normal(
      {fontWeight = FontWeight.normal, color = TColors.primary}) {
    return new TextStyle(
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      color: color,
      fontSize: 12,
    );
  }

  static TextStyle medium(
      {fontWeight = FontWeight.normal, color = TColors.primary}) {
    return new TextStyle(
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle large(
      {fontWeight = FontWeight.normal, color = TColors.primary}) {
    return new TextStyle(
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      color: color,
      fontSize: 22,
    );
  }
}
