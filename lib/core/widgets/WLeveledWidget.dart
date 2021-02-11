import 'package:atlok/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WLeveledWidget extends StatefulWidget {
  final Widget child;
  final int minimumLevel;
  final bool reverseOperator;
  const WLeveledWidget({
    Key key,
    @required this.child,
    @required this.minimumLevel,
    this.reverseOperator = false,
  }) : super(key: key);

  @override
  _WLeveledWidgetState createState() => _WLeveledWidgetState();
}

class _WLeveledWidgetState extends State<WLeveledWidget> {
  int _ual = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        _ual = sp.getInt(SPKey.access);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !widget.reverseOperator
        ? (_ual < widget.minimumLevel ? SizedBox() : widget.child)
        : (_ual > widget.minimumLevel ? SizedBox() : widget.child);
  }
}
