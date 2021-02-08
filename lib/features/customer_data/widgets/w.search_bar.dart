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
        Row(
          children: [
            Expanded(
              child: WTextField(
                labelText: "Kata Kunci",
                icon: Icons.search,
              ),
            ),
            HSpacing(TSpacing * 2),
            Container(
              height: 40,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(TSpacing),
                    boxShadow: [
                      TBoxShadow.cardNormal(),
                    ],
                  ),
                  child: Icon(
                    Icons.filter_alt,
                    color: TColors.primary,
                  ),
                ),
              ),
            )
          ],
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
