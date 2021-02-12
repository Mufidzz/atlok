import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MFare.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UCFaresForm {
  final MFare fare;
  final BuildContext context;

  String error;

  UCFaresForm(this.context, {this.fare});

  Future<void> create() async {
    var response = await http.post(
      URL.CreateFare,
      body: json.encode(
        fare.toJson(),
      ),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Tarif",
        content: "Pembuatan Tarif Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Tarif",
      content: "Pembuatan Tarif Berhasil",
      buttonText: "OK",
    );
  }

  Future<void> update() async {
    var response = await http.put(
      URL.UpdateFare(fare.iD.toString()),
      body: json.encode(
        fare.toJson(),
      ),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Tarif",
        content: "Update Tarif Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Tarif",
      content: "Update Tarif Berhasil",
      buttonText: "OK",
    );
  }
}
