import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/themes/TColors.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/WButton.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'WCustomerTile.dart';

class WCustomerList extends StatefulWidget {
  final List<MACustomer> customers;
  final int nextStart;
  WCustomerList({
    Key key,
    @required this.customers,
    @required this.nextStart,
  }) : super(key: key);

  @override
  _WCustomerListState createState() => _WCustomerListState();
}

class _WCustomerListState extends State<WCustomerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            widget.customers.length,
            (index) => WCustomerTile(
              customer: widget.customers[index],
            ),
          ),
        ),
        widget.nextStart > 0
            ? Column(
                children: [
                  VSpacing(TSpacing),
                  WButton(
                    backgroundColor: TColors.primary,
                    textColor: TColors.primary,
                    text: "Lebih Banyak",
                    isFilled: false,
                    onTap: () {},
                  ),
                ],
              )
            : SizedBox(),
        VSpacing(TSpacing * 4),
      ],
    );
  }
}
