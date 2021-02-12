import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UCSubstationDataForm {
  final MSubstation substation;
  final BuildContext context;

  String error;

  UCSubstationDataForm(this.context, {this.substation});

  Future<void> create() async {
    var response = await http.post(
      URL.CreateSubstation,
      body: json.encode(
        substation.toJson(),
      ),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Data Gardu",
        content: "Pembuatan Data Gardu Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Data Gardu",
      content: "Pembuatan Data Gardu Berhasil",
      buttonText: "OK",
    );
  }

  Future<void> update() async {
    var response = await http.put(
      URL.UpdateSubstation(substation.iD.toString()),
      body: json.encode(
        substation.toJson(),
      ),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Data Gardu",
        content: "Update Data Gardu Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }
    await UDialog(context).showSingleButtonDialog(
      title: "Data Gardu",
      content: "Update Data Gardu Berhasil",
      buttonText: "OK",
    );
  }

  Future<void> deleteSubstation({
    @required String id,
  }) async {
    var response = await http.delete(
      URL.DeleteSubstation(id),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Hapus Data",
        content: "Hapus Data Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }

    await UDialog(context).showSingleButtonDialog(
      title: "Hapus Data",
      content: "Hapus Data Berhasil",
      buttonText: "OK",
    );

    ExtendedNavigator.root
        .pushAndRemoveUntil(Routes.vFindSubstationData, (r) => false);
  }
}
