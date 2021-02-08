import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WDataInformationTile extends StatelessWidget {
  final String title;
  final String content;

  const WDataInformationTile({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TTextStyle.small(
            color: TColors.primary[3],
          ),
        ),
        Text(
          "$content",
          textAlign: TextAlign.justify,
          style: TTextStyle.normal(
            color: TColors.primary[3],
            fontWeight: FontWeight.w600,
          ),
        ),
        VSpacing(TSpacing * 2)
      ],
    );
  }
}
