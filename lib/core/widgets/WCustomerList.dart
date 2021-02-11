import 'dart:convert';

import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/themes/TColors.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/WButton.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/customer_data/usecases/u.find_customer_data.dart';
import 'package:flutter/material.dart';
import 'WCustomerTile.dart';

class WCustomerList extends StatefulWidget {
  final List<MACustomer> customers;
  final int nextStart;
  final String searchParam;
  WCustomerList({
    Key key,
    @required this.customers,
    @required this.nextStart,
    @required this.searchParam,
  }) : super(key: key);

  @override
  _WCustomerListState createState() => _WCustomerListState();
}

class _WCustomerListState extends State<WCustomerList> {
  List<MACustomer> _customers;
  int _nextStart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _customers = widget.customers;
    _nextStart = widget.nextStart;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            _customers.length,
            (index) => WCustomerTile(
              customer: _customers[index],
            ),
          ),
        ),
        _nextStart > 0
            ? Column(
                children: [
                  VSpacing(TSpacing),
                  WButton(
                    backgroundColor: TColors.primary,
                    textColor: TColors.primary,
                    text: "Lebih Banyak",
                    isFilled: false,
                    onTap: () async {
                      await UCFindCustomerData(context)
                          .searchCustomer(
                        param: "${widget.searchParam}",
                        start: _nextStart,
                        count: 10,
                      )
                          .then((response) {
                        var dJS = json.decode(response.body);
                        this._nextStart = dJS["NextStart"];
                        List<MACustomer> _tC = dJS["Data"]
                            .map<MACustomer>(
                                (json) => MACustomer.fromJson(json))
                            .toList();
                        setState(() {
                          _customers.addAll(_tC);
                        });
                      });
                    },
                  ),
                ],
              )
            : SizedBox(),
        VSpacing(TSpacing * 4),
      ],
    );
  }
}
