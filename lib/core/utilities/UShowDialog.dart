import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/WButton.dart';
import 'package:flutter/material.dart';

class UDialog {
  final BuildContext context;
  UDialog(this.context);

  Future<void> showSingleButtonDialog({
    @required String title,
    @required String content,
    @required String buttonText,
    Color buttonColor = TColors.primary,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(
          TSpacing * 4,
          TSpacing,
          TSpacing * 4,
          TSpacing * 2,
        ),
        titlePadding: EdgeInsets.fromLTRB(
          TSpacing * 4,
          TSpacing * 4,
          TSpacing * 4,
          0,
        ),
        title: Text(
          "$title",
          style: TTextStyle.normal(
            fontWeight: FontWeight.w600,
            color: TColors.primary[3],
          ),
        ),
        content: Text(
          "$content",
          style: TTextStyle.normal(
            color: TColors.primary[3],
          ),
        ),
        actions: [
          Container(
            width: TSpacing * 30,
            child: WButton(
              height: TSpacing * 6,
              textColor: Colors.white,
              backgroundColor: buttonColor,
              text: "$buttonText",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
