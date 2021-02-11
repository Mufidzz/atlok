import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/auth/usecases/u.login.dart';
import 'package:flutter/material.dart';

class WLoginForm extends StatefulWidget {
  const WLoginForm({
    Key key,
  }) : super(key: key);

  @override
  _WLoginFormState createState() => _WLoginFormState();
}

class _WLoginFormState extends State<WLoginForm> {
  GlobalKey<FormState> _formKey;
  MUser _user;

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
          VSpacing(TSpacing * 4),
          WButton(
            text: "Masuk",
            textColor: Colors.white,
            onTap: () async {
              if (!_formKey.currentState.validate()) {
                return;
              }

              try {
                await UCLogin(
                  context,
                  user: this._user,
                ).authorize();
              } catch (Exception) {
                await UDialog(context).showSingleButtonDialog(
                  title: "Login",
                  content: "Invalid Parameter, Exception Found",
                  buttonText: "OK",
                );
              }
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
            text: "Daftar",
            isFilled: false,
            textColor: TColors.primary,
            onTap: () {
              UCLogin.goToRegister();
            },
            backgroundColor: TColors.primary,
          )
        ],
      ),
    );
  }
}
