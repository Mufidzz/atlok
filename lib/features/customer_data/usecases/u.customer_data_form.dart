import 'dart:convert';

import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UCCustomerDataForm {
  final MCustomer customer;
  final BuildContext context;

  String error;

  UCCustomerDataForm(this.context, {this.customer});

  Future<void> create() async {
    var response = await http.post(
      URL.CreateCustomer,
      body: json.encode(
        customer.toJson(),
      ),
    );

    if (response.statusCode != 200) {
      await UDialog(context).showSingleButtonDialog(
        title: "Data Pelanggan",
        content: "Pembuatan Data Pelanggan Gagal",
        buttonText: "OK",
      );
      this.error = response.body;
      return;
    }

    await UDialog(context).showSingleButtonDialog(
      title: "Data Pelanggan",
      content: "Pembuatan Data Pelanggan Berhasil",
      buttonText: "OK",
    );
  }
}
