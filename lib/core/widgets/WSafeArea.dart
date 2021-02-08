import 'package:flutter/material.dart';

class WSafeArea extends StatelessWidget {
  final Widget child;
  final Color color;
  const WSafeArea({
    Key key,
    @required this.child,
    this.color = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
