import 'package:atlok/core/themes/themes.dart';
import 'package:flutter/material.dart';

class FormFieldValidations {
  static String requiredField(String value,
      {validationText = "This form is Required"}) {
    if (value.isEmpty) {
      return validationText;
    }
    return null;
  }

  static String numberOnlyField(String value,
      {validationText = "This form is Number Only"}) {
    if (value.contains(RegExp(r"^[0-9]"))) {
      return validationText;
    }
    return null;
  }

  static String escapeSpecialCharacterField(String value,
      {validationText = "Special Character not Allowed"}) {
    if (value.contains(RegExp(r"[A-Za-z0-9]*"))) {
      return validationText;
    }
    return null;
  }

  static String escapeRegex(String value, String regex,
      {validationText = "Some Character is Not Allowed"}) {
    if (value.contains(RegExp(regex))) {
      return validationText;
    }
    return null;
  }
}

class WTextField extends StatelessWidget {
  final labelText;
  final hintText;
  final Color backgroundColor;
  final int maxLines;
  final bool gutterTop;
  final bool gutterBottom;
  final bool required;
  final bool numberOnly;
  final bool escapeSpecialCharacter;
  final bool obscureText;
  final IconData icon;
  final Widget suffixIcon;
  final String escapeRegex;
  final TextInputType keyboardType;
  final onChanged;

  const WTextField({
    Key key,
    this.labelText = "",
    this.hintText = "",
    this.gutterTop = true,
    this.gutterBottom = true,
    this.required = false,
    this.numberOnly = false,
    this.escapeSpecialCharacter = false,
    this.escapeRegex = "",
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.icon,
    this.suffixIcon,
    this.onChanged,
    this.maxLines = 1,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        0,
        gutterTop ? TSpacing : 0,
        0,
        gutterBottom ? TSpacing : 0,
      ),
      padding: const EdgeInsets.fromLTRB(
        TSpacing * 2,
        TSpacing * 1,
        TSpacing * 2,
        TSpacing * 1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(TSpacing),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(
              1,
              2,
            ), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: TColors.primary[3],
        style: TTextStyle.normal(),
        maxLines: maxLines,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: icon != null
              ? Container(
                  margin: EdgeInsets.only(
                    right: TSpacing * 2,
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                  ),
                )
              : null,
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(maxHeight: 22),
          prefixIconConstraints: BoxConstraints(maxHeight: 22),
          labelText: labelText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          errorStyle: TTextStyle.small(color: Colors.red[800]),
          contentPadding: const EdgeInsets.all(0),
          hintText: hintText,
        ),
        onChanged: onChanged,
        validator: (String value) {
          String r = "";
          if (required) {
            r = FormFieldValidations.requiredField(value);
          }

          if (numberOnly) {
            r = FormFieldValidations.numberOnlyField(value);
          }

          if (escapeSpecialCharacter) {
            r = FormFieldValidations.escapeSpecialCharacterField(value);
          }

          if (escapeRegex != "") {
            r = FormFieldValidations.escapeRegex(value, escapeRegex);
          }
          return r;
        },
      ),
    );
  }
}
