import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WUserTile extends StatelessWidget {
  final bool showVerificationIcon;
  const WUserTile({
    Key key,
    this.showVerificationIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Icon(
                  Icons.person,
                  color: TColors.primary,
                ),
              ),
            ),
            HSpacing(TSpacing * 2),
            Expanded(
              child: Text(
                "12345678901234567890",
                style: TTextStyle.normal(
                  color: TColors.primary[3],
                ),
              ),
            ),
            HSpacing(TSpacing * 2),
            showVerificationIcon ? WVerificationIcon() : SizedBox(),
          ],
        ),
        VSpacing(TSpacing * 2),
      ],
    );
  }
}

class WVerificationIcon extends StatelessWidget {
  const WVerificationIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: FaIcon(
            FontAwesomeIcons.check,
            color: TColors.primary,
            size: 18,
          ),
          onPressed: () {},
        ),
        HSpacing(TSpacing * 4),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: FaIcon(
            FontAwesomeIcons.times,
            color: TColors.red,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
