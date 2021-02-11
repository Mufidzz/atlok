import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/auth/usecases/u.register.dart';
import 'package:flutter/material.dart';

class WRegisterForm extends StatefulWidget {
  @override
  _WRegisterFormState createState() => _WRegisterFormState();
}

class _WRegisterFormState extends State<WRegisterForm> {
  GlobalKey<FormState> _formKey;
  MUser _user;
  String _passwordConfirmation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _user = new MUser();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          WTextField(
            labelText: "Username",
            hintText: "Masukkan Username",
            icon: Icons.person_outlined,
            required: true,
            onChanged: (String v) {
              this._user.username = v;
            },
          ),
          WTextField(
            labelText: "Password",
            hintText: "Masukkan Password",
            icon: Icons.lock_open_rounded,
            obscureText: true,
            required: true,
            onChanged: (String v) {
              this._user.password = v;
            },
          ),
          WTextField(
            labelText: "Konfirmasi Password",
            hintText: "Masukkan Konfirmasi Password",
            icon: Icons.lock_open_rounded,
            obscureText: true,
            required: true,
            onChanged: (String v) {
              this._passwordConfirmation = v;
            },
          ),
          VSpacing(TSpacing * 4),
          WButton(
            text: "Daftar",
            textColor: Colors.white,
            onTap: () async {
              if (!_formKey.currentState.validate()) {
                return;
              }

              if (_user.password != _passwordConfirmation) {
                print("DDD");
                new UDialog(context).showSingleButtonDialog(
                  title: "Daftar",
                  content: "Password dan Konfirmasi Password Tidak Cocok",
                  buttonText: "OK",
                );
                return;
              }

              await UCRegister(
                context,
                user: this._user,
              ).register();
            },
            backgroundColor: TColors.primary,
          ),
          WTextDivider(
            padding: EdgeInsets.only(
              top: TSpacing,
              bottom: TSpacing,
            ),
          ),
          WButton(
            text: "Masuk",
            isFilled: false,
            textColor: TColors.primary,
            onTap: () {
              UCRegister.goToLogin();
            },
            backgroundColor: TColors.primary,
          )
        ],
      ),
    );
  }
}
