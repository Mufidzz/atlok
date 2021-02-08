import 'package:atlok/core/routes/asset_routes.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WHeader extends StatelessWidget {
  final String text;
  const WHeader({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacing(TSpacing * 30),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                RAssets.Logo,
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        VSpacing(TSpacing * 20),
        Text(
          "$text",
          style: TTextStyle.large(
            fontWeight: FontWeight.w500,
          ),
        ),
        VSpacing(TSpacing * 4),
      ],
    );
  }
}
