import 'package:atlok/core/themes/themes.dart';
import 'package:flutter/material.dart';

enum TextDividerAlignment { center, left, right }

class WTextDivider extends StatelessWidget {
  final String text;
  final TextDividerAlignment alignment;
  final EdgeInsets padding;
  final Color color;

  const WTextDivider({
    Key key,
    this.text = "atau",
    this.alignment = TextDividerAlignment.center,
    this.padding = EdgeInsets.zero,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          alignment == TextDividerAlignment.left
              ? SizedBox()
              : Expanded(
                  child: Container(
                    child: Divider(
                      color: color,
                      thickness: 1,
                    ),
                  ),
                ),
          Container(
            margin: EdgeInsets.fromLTRB(
                TSpacing * (alignment == TextDividerAlignment.left ? 0 : 3),
                0,
                TSpacing * (alignment == TextDividerAlignment.right ? 0 : 3),
                0),
            child: Text(
              text,
              style:
                  TTextStyle.small(fontWeight: FontWeight.w500, color: color),
            ),
          ),
          alignment == TextDividerAlignment.right
              ? SizedBox()
              : Expanded(
                  child: Container(
                    child: Divider(
                      color: color,
                      thickness: 1,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
