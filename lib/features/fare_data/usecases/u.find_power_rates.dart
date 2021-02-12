import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/routes/routes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UCFindFares {
  final BuildContext context;

  String error;
  UCFindFares(this.context);

  static void goToSubstationForm() {
    ExtendedNavigator.root.push(Routes.vFaresForm);
  }

  Future<http.Response> searchFares({
    @required String param,
    @required int start,
    @required int count,
  }) async {
    var response = await http.get(
      URL.SearchFares(param, start, count),
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

    return response;
  }
}
