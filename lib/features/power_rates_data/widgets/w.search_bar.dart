import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/power_rates_data/usecases/u.find_power_rates.dart';
import 'package:atlok/features/substation_data/usecases/u.find_substation_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WSearchBar extends StatefulWidget {
  final Function beforeFind;
  final Function afterFind;

  const WSearchBar({
    Key key,
    @required this.beforeFind,
    @required this.afterFind,
  }) : super(key: key);

  @override
  _WSearchBarState createState() => _WSearchBarState();
}

class _WSearchBarState extends State<WSearchBar> {
  String _param = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WTextField(
          labelText: "Kata Kunci",
          icon: Icons.search,
          onChanged: (String v) {
            this._param = v;
          },
        ),
        VSpacing(TSpacing),
        WButton(
          text: "Cari",
          textColor: TColors.primary[-3],
          onTap: () async {
            widget.beforeFind();
            var r = await UCFindPowerRates(context).searchPowerRates(
              param: "$_param",
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
