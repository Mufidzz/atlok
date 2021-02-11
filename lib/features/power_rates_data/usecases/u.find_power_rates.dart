import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/routes/routes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UCFindPowerRates {
  final BuildContext context;

  String error;
  UCFindPowerRates(this.context);

  static void goToSubstationForm() {
    ExtendedNavigator.root.push(Routes.vSubstationDataForm);
  }

  Future<http.Response> searchPowerRates({
    @required String param,
    @required int start,
    @required int count,
  }) async {
    var response = await http.get(
      URL.SearchPowerRate(param, start, count),
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

    return response;
  }
}
