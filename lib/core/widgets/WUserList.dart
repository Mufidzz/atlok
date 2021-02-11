import 'package:atlok/core/models/MUser.dart';
import 'package:flutter/material.dart';

import 'WUserTile.dart';

class WUserList extends StatelessWidget {
  final List<MUser> users;
  final int nextStart;
  const WUserList({
    Key key,
    @required this.users,
    @required this.nextStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          users.length,
          (index) => WUserTile(
            user: users[index],
          ),
        ),
      ),
    );
  }
}
