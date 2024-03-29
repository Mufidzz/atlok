import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/user_data/widgets/w.search_bar.dart';
import 'package:flutter/material.dart';

class VManageUser extends StatelessWidget {
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
                "Data Pengguna",
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
                    WSearchBar(),
                    VSpacing(TSpacing * 2),
                    WTextDivider(
                      text: "Hasil Pencarian",
                      color: TColors.primary,
                    ),
                    VSpacing(TSpacing * 2),
                    Expanded(
                      child: SingleChildScrollView(
                        child: WUserList(),
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
