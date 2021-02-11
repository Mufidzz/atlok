import 'package:atlok/core/models/MCustomerChange.dart';
import 'package:atlok/core/themes/TColors.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/WButton.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/verification/widgets/w.customer_data_change_tile.dart';
import 'package:flutter/material.dart';

class WCustomerDataChangeList extends StatefulWidget {
  final List<MACustomerChange> customers;
  final int nextStart;
  WCustomerDataChangeList({
    Key key,
    @required this.customers,
    @required this.nextStart,
  }) : super(key: key);

  @override
  _WCustomerListState createState() => _WCustomerListState();
}

class _WCustomerListState extends State<WCustomerDataChangeList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            widget.customers.length,
            (index) => WCustomerDataChangeTile(
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
