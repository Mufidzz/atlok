import 'dart:convert';

import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/substation_data/widgets/w.search_bar.dart';
import 'package:atlok/features/substation_data/widgets/w.substation_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VFindSubstationData extends StatefulWidget {
  @override
  _VFindSubstationDataState createState() => _VFindSubstationDataState();
}

class _VFindSubstationDataState extends State<VFindSubstationData> {
  int _nextStart = -1;
  List<MSubstation> _substations = new List();

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
                "Data Gardu",
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
                          _substations = dJSON["Data"]
                              .map<MSubstation>(
                                (json) => MSubstation.fromJson(json),
                              )
                              .toList();

                          print(_substations.length);
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
                        child: WSubstationList(
                          substations: _substations,
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
                onTap: () {},
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

class WSubstationList extends StatelessWidget {
  final List<MSubstation> substations;
  const WSubstationList({
    Key key,
    @required this.substations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        substations.length,
        (index) => WSubstationTile(substation: substations[index]),
      ),
    );
  }
}
