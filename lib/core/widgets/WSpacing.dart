import 'package:flutter/cupertino.dart';

class VSpacing extends StatelessWidget {
  final double h;

  const VSpacing(this.h, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
    );
  }
}

class HSpacing extends StatelessWidget {
  final double w;

  const HSpacing(this.w, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
    );
  }
}
