import 'package:atlok/core/themes/themes.dart';
import 'package:flutter/material.dart';

class WDropdownWrapper extends StatelessWidget {
  final DropdownButton dropdownButton;
  final IconData prefixIcon;
  final String labelText;
  const WDropdownWrapper({
    Key key,
    @required this.dropdownButton,
    this.prefixIcon,
    @required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(
        0,
        TSpacing,
        0,
        TSpacing,
      ),
      padding: const EdgeInsets.fromLTRB(
        TSpacing * 2,
        TSpacing,
        TSpacing * 2,
        TSpacing,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TSpacing),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: TSpacing * 2,
            ),
            child: Icon(
              prefixIcon,
              size: 22,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$labelText",
                  style: TTextStyle.smallest(color: Colors.grey[600]),
                ),
                Container(
                  height: 18,
                  child: dropdownButton,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: TSpacing * 2,
            ),
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 22,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
