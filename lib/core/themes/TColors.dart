import 'package:flutter/material.dart';

class TColors {
  static const int _white = 0xFFFFFFFF;
  static const MaterialColor primary = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      -3: Color(_white),
      -2: Color(0xFF8EB1C5),
      -1: Color(0xFF4A81A2),
      0: Color(_primaryColorValue),
      1: Color(0xFF174E6F),
      2: Color(0xFF0F3146),
      3: Color(0xFF030A0E),
    },
  );
  static const int _primaryColorValue = 0xFF1D628B;

  static const MaterialColor red = MaterialColor(
    _redColorValue,
    <int, Color>{
      -1: Color(0xFFCE5F5F),
      0: Color(_redColorValue),
    },
  );
  static const int _redColorValue = 0xFFC23737;
}
