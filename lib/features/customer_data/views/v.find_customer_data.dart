import 'dart:convert';

import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/customer_data/usecases/u.find_customer_data.dart';
import 'package:atlok/features/customer_data/widgets/w.search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VFindCustomerData extends StatefulWidget {
  @override
  _VFindCustomerDataState createState() => _VFindCustomerDataState();
}

class _VFindCustomerDataState extends State<VFindCustomerData> {
  List<MACustomer> customers = new List();
  int nextStart = -1;
  int totalData = 0;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        endDrawer: WMainDrawer(),
        body: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: TColors.primary,
              title: Text(
                "Cari Data",
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
                      beforeFind: () {
                        setState(() {
                          this.isLoading = true;
                        });
                      },
                      afterFind: (http.Response response) {
                        var djson = json.decode(response.body);
                        var _tc = djson["Data"]
                            .map<MACustomer>(
                                (json) => MACustomer.fromJson(json))
                            .toList();

                        setState(() {
                          this.isLoading = false;
                          customers = _tc;
                          this.nextStart = djson["NextStart"];
                          this.totalData = djson["TotalDataFound"];
                        });
                      },
                    ),
                    VSpacing(TSpacing * 2),
                    WTextDivider(
                      text: "Hasil Pencarian",
                      color: TColors.primary,
                    ),
                    VSpacing(TSpacing),
                    Container(
                      child: Text(
                        "Jumlah Data : $totalData",
                        style: TTextStyle.small(
                          fontWeight: FontWeight.w600,
                          color: TColors.primary[3],
                        ),
                      ),
                    ),
                    VSpacing(TSpacing * 2),
                    Expanded(
                      child: SingleChildScrollView(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : WCustomerList(
                                customers: this.customers,
                                nextStart: this.nextStart,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            WLeveledWidget(
              minimumLevel: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  TSpacing * 6,
                  TSpacing * 4,
                  TSpacing * 6,
                  TSpacing * 4,
                ),
                child: WButton(
                  onTap: () {
                    UCFindCustomerData.goToCustomerDataForm();
                  },
                  text: "Tambah Data",
                  textColor: TColors.primary[-3],
                  backgroundColor: TColors.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
