import 'dart:convert';

import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/power_rates_data/widgets/w.power_rate_tile.dart';
import 'package:atlok/features/power_rates_data/widgets/w.search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VFindPowerRates extends StatefulWidget {
  @override
  _VFindPowerRatesState createState() => _VFindPowerRatesState();
}

class _VFindPowerRatesState extends State<VFindPowerRates> {
  List<MPowerRate> _powerRates = new List();
  int _nextStart = -1;

  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              backgroundColor: TColors.primary,
              title: Text(
                "Data Tarif Daya",
                style: TTextStyle.medium(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  TSpacing * 6,
                  TSpacing * 4,
                  TSpacing * 6,
                  0,
                ),
                child: Column(
                  children: [
                    WSearchBar(
                      afterFind: (http.Response response) {
                        var dJSON = json.decode(response.body);

                        setState(() {
                          _nextStart = dJSON["NextStart"];
                          _powerRates = dJSON["Data"]
                              .map<MPowerRate>(
                                (json) => MPowerRate.fromJson(json),
                              )
                              .toList();
                        });
                      },
                      beforeFind: () {},
                    ),
                    VSpacing(TSpacing * 2),
                    WTextDivider(
                      text: "Hasil Pencarian",
                      color: TColors.primary,
                    ),
                    VSpacing(TSpacing * 2),
                    Expanded(
                      child: SingleChildScrollView(
                        child: WPowerRateList(
                          powerRates: _powerRates,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                TSpacing * 6,
                TSpacing * 4,
                TSpacing * 6,
                TSpacing * 4,
              ),
              child: WButton(
                onTap: () {
                  ExtendedNavigator.root.push(Routes.vPowerRatesForm);
                },
                text: "Tambah Data",
                textColor: TColors.primary[-3],
                backgroundColor: TColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WPowerRateList extends StatelessWidget {
  final List<MPowerRate> powerRates;
  const WPowerRateList({
    Key key,
    @required this.powerRates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        powerRates.length,
        (index) => WPowerRateTile(
          powerRate: powerRates[index],
        ),
      ),
    );
  }
}
