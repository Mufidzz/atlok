import 'package:atlok/core/themes/themes.dart';
import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  final Color backgroundColor;
  final bool isFilled;
  final Color textColor;
  final Function onLongPress;
  final String text;
  final Function onTap;
  final double height;
  final double width;
  final FontWeight fontWeight;

  const WButton({
    Key key,
    @required this.backgroundColor,
    this.isFilled = true,
    @required this.textColor,
    @required this.text,
    @required this.onTap,
    this.height = TSpacing * 8,
    this.width = double.infinity,
    this.fontWeight = FontWeight.w600,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isFilled ? backgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(TSpacing),
        border: Border.all(
          color: backgroundColor,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress ?? () {},
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TTextStyle.normal(
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
