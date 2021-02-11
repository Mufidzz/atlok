import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MPagedResponse.dart';
import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UCUserRegisterVerification {
  final BuildContext context;

  UCUserRegisterVerification(this.context);

  String error = "";

  Future<MPagedResponse> loadUnverifiedUsers({
    @required int start,
    @required int count,
  }) async {
    var response = await http.get(
      URL.GetUnverifiedUsers(start, count),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Pencarian",
        content: "Pencarian Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return null;
    }

    var dJSON = json.decode(response.body);
    var _l = dJSON["Data"].map<MUser>((json) => MUser.fromJson(json)).toList();

    return new MPagedResponse(nextStart: dJSON["NextStart"], list: _l);
  }

  Future<void> verifyUser({
    @required int id,
  }) async {
    var response = await http.get(
      URL.VerifyUser(id.toString()),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Verifikasi",
        content: "Verifikasi Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      print(this.error);
      return null;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Verifikasi",
      content: "Verifikasi Berhasil",
      buttonText: "OK",
    );

    return;
  }
}
