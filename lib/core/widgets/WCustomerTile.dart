import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/routes/routes.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class WCustomerTile extends StatelessWidget {
  final MACustomer customer;
  const WCustomerTile({
    Key key,
    @required this.customer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ExtendedNavigator.root.push(
          Routes.vCustomerDataDetail,
          arguments: VCustomerDataDetailArguments(
            customer: customer,
          ),
        );
      },
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
                    Icons.person,
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
                      "${customer.iDPEL}",
                      style: TTextStyle.normal(
                        color: TColors.primary[3],
                      ),
                    ),
                    Text(
                      "${customer.fullName}, ${customer.powerRating.name}",
                      style: TTextStyle.small(
                        color: TColors.primary[3],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          VSpacing(TSpacing * 2),
        ],
      ),
    );
  }
}
