import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WCustomerTile extends StatelessWidget {
  const WCustomerTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                    color: TColors.primary,
                  ),
                ),
              ),
              HSpacing(TSpacing * 2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "12345678901234567890",
                      style: TTextStyle.normal(
                        color: TColors.primary[3],
                      ),
                    ),
                    Text(
                      "Nama Lengkap, Tarif Daya",
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
