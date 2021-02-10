import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/customer_data/usecases/u.find_customer_data.dart';
import 'package:flutter/material.dart';

class WSearchBar extends StatefulWidget {
  final Function afterFind;
  final Function beforeFind;
  const WSearchBar({
    Key key,
    this.afterFind,
    this.beforeFind,
  }) : super(key: key);

  @override
  _WSearchBarState createState() => _WSearchBarState();
}

class _WSearchBarState extends State<WSearchBar> {
  bool _advanceSearchActive = false;
  String _searchParam = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: WTextField(
                labelText: "IDPEL / Nama Lengkap",
                icon: Icons.search,
                onChanged: (String v) {
                  this._searchParam = v;
                },
              ),
            ),
            HSpacing(TSpacing * 2),
            InkWell(
              onTap: () {
                setState(() {
                  _advanceSearchActive = _advanceSearchActive ? false : true;
                });
              },
              child: Container(
                height: 40,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(TSpacing),
                      boxShadow: [
                        TBoxShadow.cardNormal(),
                      ],
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        _advanceSearchActive
            ? Column(
                children: [
                  VSpacing(TSpacing),
                  WButton(
                    backgroundColor: TColors.primary,
                    onTap: () {},
                    text: "Tarif Daya",
                    isFilled: false,
                    textColor: TColors.primary,
                  ),
                  VSpacing(TSpacing),
                  WButton(
                    backgroundColor: TColors.primary,
                    onTap: () {},
                    text: "Gardu",
                    isFilled: false,
                    textColor: TColors.primary,
                  ),
                  VSpacing(TSpacing),
                ],
              )
            : SizedBox(),
        VSpacing(TSpacing),
        WButton(
          text: "Cari",
          textColor: TColors.primary[-3],
          onTap: () async {
            widget.beforeFind();

            var r = await UCFindCustomerData(context).searchCustomer(
              param: "$_searchParam",
              start: 0,
              count: 10,
            );

            widget.afterFind(r);
          },
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
