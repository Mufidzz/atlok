import 'package:flutter/material.dart';

import 'WUserTile.dart';

class WUserList extends StatelessWidget {
  const WUserList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WUserTile(),
        WUserTile(),
        WUserTile(),
        WUserTile(),
        WUserTile(),
        WUserTile(),
        WUserTile(),
        WUserTile(),
        WUserTile(),
      ],
    );
  }
}
