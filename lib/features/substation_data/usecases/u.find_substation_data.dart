import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UCFindSubstationData {
  final BuildContext context;

  String error;
  UCFindSubstationData(this.context);

  static void goToSubstationForm() {
    ExtendedNavigator.root.push(Routes.vSubstationDataForm);
  }

  Future<http.Response> searchSubstation({
    @required String param,
    @required int start,
    @required int count,
  }) async {
    var response = await http.get(
      URL.SearchSubstation(param, start, count),
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
