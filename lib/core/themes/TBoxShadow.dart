import 'package:flutter/material.dart';

class TBoxShadow {
  static cardNormal() {
    return BoxShadow(
      color: Colors.grey.withOpacity(.2),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(1, 1),
    );
  }
}
