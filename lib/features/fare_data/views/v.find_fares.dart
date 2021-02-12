import 'dart:convert';

import 'package:atlok/core/models/MFare.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/fare_data/widgets/w.fares_tile.dart';
import 'package:atlok/features/power_rates_data/widgets/w.power_rate_tile.dart';
import 'package:atlok/features/power_rates_data/widgets/w.search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VFindFares extends StatefulWidget {
  @override
  _VFindFaresState createState() => _VFindFaresState();
}

class _VFindFaresState extends State<VFindFares> {
  List<MFare> _fares = new List();
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
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
              ),
              title: Text(
                "Data Tarif",
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
                          _fares = dJSON["Data"]
                              .map<MFare>(
                                (json) => MFare.fromJson(json),
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
                        child: WFaresList(
                          fares: _fares,
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
                  ExtendedNavigator.root.push(Routes.vFaresForm);
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

class WFaresList extends StatelessWidget {
  final List<MFare> fares;
  const WFaresList({
    Key key,
    @required this.fares,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        fares.length,
        (index) => WFaresTile(
          fare: fares[index],
        ),
      ),
    );
  }
}
