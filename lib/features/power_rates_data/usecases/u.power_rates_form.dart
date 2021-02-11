import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UCPowerRatesForm {
  final MPowerRate powerRate;
  final BuildContext context;

  String error;

  UCPowerRatesForm(this.context, {this.powerRate});

  Future<void> create() async {
    var response = await http.post(
      URL.CreatePowerRate,
      body: json.encode(
        powerRate.toJson(),
      ),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Tarif Daya",
        content: "Pembuatan Tarif Daya Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Daftar",
      content: "Pembuatan Tarif Daya Berhasil",
      buttonText: "OK",
    );
  }
}
