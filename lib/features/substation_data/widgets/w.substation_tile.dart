import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/routes/routes.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class WSubstationTile extends StatelessWidget {
  final MSubstation substation;
  const WSubstationTile({
    Key key,
    @required this.substation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ExtendedNavigator.root.push(
          Routes.vSubstationDataDetail,
          arguments: VSubstationDataDetailArguments(
            substation: substation,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          top: TSpacing * 2,
          bottom: TSpacing * 2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Icon(
                      Icons.account_tree,
                      color: TColors.primary[-2],
                    ),
                  ),
                ),
                HSpacing(TSpacing * 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${substation.code}",
                        style: TTextStyle.normal(
                          color: TColors.primary[3],
                        ),
                      ),
                      Text(
                        "${substation.name}",
                        style: TTextStyle.small(
                          color: TColors.primary[3],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
