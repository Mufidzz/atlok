import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WSearchBar extends StatelessWidget {
  const WSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WTextField(
          labelText: "Kata Kunci",
          icon: Icons.search,
        ),
        VSpacing(TSpacing),
        WButton(
          text: "Cari",
          textColor: TColors.primary[-3],
          onTap: () {},
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
