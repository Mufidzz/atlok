import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class UCRegister {
  final MUser user;
  final BuildContext context;

  String error;

  UCRegister(this.context, {this.user});
  static void goToLogin() {
    ExtendedNavigator.root.replace(Routes.vLogin);
  }

  Future<void> register() async {
    var response = await http.post(
      URL.Register,
      body: json.encode(
        {
          "Username": "${user.username}",
          "Password": "${user.password}",
        },
      ),
    );

    if (response.statusCode != 200) {
      if (response.statusCode == 302) {
        await UDialog(context).showSingleButtonDialog(
          title: "Daftar",
          content: "Pendaftaran Gagal, Username Telah Terpakai",
          buttonText: "OK",
        );
        this.error = response.body;
        return;
      }

      await UDialog(context).showSingleButtonDialog(
        title: "Daftar",
        content: "Pendaftaran Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Daftar",
      content: "Pendaftaran Berhasil",
      buttonText: "Login",
    );

    goToLogin();
  }
}
