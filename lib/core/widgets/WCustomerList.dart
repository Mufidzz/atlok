import 'package:flutter/material.dart';

import 'WCustomerTile.dart';

class WCustomerList extends StatelessWidget {
  const WCustomerList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        20,
        (index) => WCustomerTile(),
      ),
    );
  }
}
