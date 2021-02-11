import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
