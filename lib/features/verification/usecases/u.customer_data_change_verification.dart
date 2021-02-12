import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/models/MCustomerChange.dart';
import 'package:atlok/core/models/MPagedResponse.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UCCustomerDataChangeVerification {
  final BuildContext context;

  UCCustomerDataChangeVerification(this.context);

  String error = "";

  Future<MPagedResponse> loadCustomerChange({
    @required int start,
    @required int count,
  }) async {
    var response = await http.get(
      URL.GetCustomerChange(start, count),
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
    var _l = dJSON["Data"]
        .map<MACustomerChange>((json) => MACustomerChange.fromJson(json))
        .toList();

    return new MPagedResponse(nextStart: dJSON["NextStart"], list: _l);
  }

  Future<MACustomer> loadCustomer({@required String id}) async {
    var response = await http.get(
      URL.GetCustomer(id),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Pengambilan Data",
        content: "Pengambilan Data Pelanggan Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return null;
    }

    return new MACustomer.fromJson(json.decode(response.body));
  }

  Future<void> acceptChange({@required String customerChangeID}) async {
    var response = await http.patch(
      URL.PatchCustomerChange(customerChangeID, true),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Verifikasi Data",
        content: "Verifikasi Perubahan Data Pelanggan Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return null;
    }

    await UDialog(context).showSingleButtonDialog(
      title: "Verifikasi Data",
      content: "Verifikasi Perubahan Data Pelanggan Berhasil",
      buttonText: "OK",
    );

    ExtendedNavigator.root.replace(Routes.vCustomerDataChangeVerification);
    return;
  }

  Future<void> denyChange({@required String customerChangeID}) async {
    var response = await http.patch(
      URL.PatchCustomerChange(customerChangeID, false),
      headers: {
        "TOKEN": await SharedPreferences.getInstance()
            .then((value) => value.get(SPKey.token)),
      },
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Verifikasi Data",
        content: "Verifikasi Perubahan Data Pelanggan Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return null;
    }

    await UDialog(context).showSingleButtonDialog(
      title: "Verifikasi Data",
      content: "Verifikasi Perubahan Data Pelanggan Berhasil",
      buttonText: "OK",
    );

    ExtendedNavigator.root.replace(Routes.vCustomerDataChangeVerification);
    return;
  }
}
