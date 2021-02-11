import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/routes/routes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UCLogin {
  final MUser user;
  final BuildContext context;

  String token;
  String error;

  UCLogin(this.context, {this.user});

  static void goToRegister() {
    ExtendedNavigator.root.replace(Routes.vRegister);
  }

  Future<void> authorize() async {
    var response = await http.post(
      URL.Login,
      body: json.encode(
        {
          "Username": "${user.username}",
          "Password": "${user.password}",
        },
      ),
    );

    if (response.statusCode != 200) {
      if (response.statusCode == 426) {
        await UDialog(context).showSingleButtonDialog(
          title: "Login",
          content: "User Belum Terverifikasi, Kontak Admin",
          buttonText: "OK",
        );
        this.error = response.body;
        return;
      }

      await UDialog(context).showSingleButtonDialog(
        title: "Login",
        content: "Username / Password Salah",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }

    this.token = response.body.toString().replaceAll("\"", "");

    Map<String, dynamic> dToken = JwtDecoder.decode(this.token);

    var sp = await SharedPreferences.getInstance();
    sp.setString(SPKey.token, this.token);
    sp.setInt(SPKey.access, dToken["acs"]);

    ExtendedNavigator.root.replace(Routes.vFindCustomerData);
  }
}
