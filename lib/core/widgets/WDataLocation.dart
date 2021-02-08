import 'package:atlok/core/themes/themes.dart';
import 'package:flutter/material.dart';

import 'WButton.dart';
import 'WSpacing.dart';

class WDataLocation extends StatelessWidget {
  const WDataLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Titik Lokasi",
          style: TTextStyle.small(
            color: TColors.primary[3],
          ),
        ),
        VSpacing(TSpacing),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(TSpacing),
          ),
          child: AspectRatio(aspectRatio: 16 / 9),
        ),
        VSpacing(TSpacing * 2),
        WButton(
          backgroundColor: TColors.primary,
          textColor: TColors.primary[-3],
          text: "Navigasi",
          onTap: () {},
        ),
      ],
    );
  }
}
