import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WLoginForm extends StatelessWidget {
  const WLoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          WTextField(
            labelText: "Username",
            hintText: "Masukkan Username",
            icon: Icons.person_outlined,
            required: true,
          ),
          WTextField(
            labelText: "Password",
            hintText: "Masukkan Password",
            icon: Icons.lock_open_rounded,
            obscureText: true,
            required: true,
          ),
          VSpacing(TSpacing * 4),
          WButton(
            text: "Masuk",
            textColor: Colors.white,
            onTap: () {},
            backgroundColor: TColors.primary,
          ),
          WTextDivider(
            padding: EdgeInsets.only(
              top: TSpacing,
              bottom: TSpacing,
            ),
          ),
          WButton(
            text: "Daftar",
            isFilled: false,
            textColor: TColors.primary,
            onTap: () {},
            backgroundColor: TColors.primary,
          )
        ],
      ),
    );
  }
}
