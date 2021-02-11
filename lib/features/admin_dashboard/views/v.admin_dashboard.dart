import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/admin_dashboard/usecases/u.admin_dashboard.dart';
import 'package:flutter/material.dart';

class VAdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        endDrawer: WMainDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: TColors.primary,
              automaticallyImplyLeading: false,
              title: Text(
                "Menu Admin",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data",
                      style: TTextStyle.medium(
                        color: TColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    VSpacing(TSpacing * 2),
                    WButton(
                      backgroundColor: TColors.primary,
                      textColor: TColors.primary[-3],
                      text: "Gardu",
                      onTap: () {
                        UCAdminDashboard.goToFindSubstation();
                      },
                    ),
                    VSpacing(TSpacing * 2),
                    WButton(
                      backgroundColor: TColors.primary,
                      textColor: TColors.primary[-3],
                      text: "Pelanggan",
                      onTap: () {
                        UCAdminDashboard.goToFindCustomer();
                      },
                    ),
                    VSpacing(TSpacing * 2),
                    WButton(
                      backgroundColor: TColors.primary,
                      textColor: TColors.primary[-3],
                      text: "Tarif Daya",
                      onTap: () {
                        UCAdminDashboard.goToFindPowerRates();
                      },
                    ),
                    VSpacing(TSpacing * 4),
                    Text(
                      "Verifikasi",
                      style: TTextStyle.medium(
                        color: TColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    VSpacing(TSpacing * 2),
                    WButton(
                      backgroundColor: TColors.primary,
                      textColor: TColors.primary[-3],
                      text: "Pengajuan Perubahan",
                      onTap: () {
                        UCAdminDashboard.goToCustomerChangeVerification();
                      },
                    ),
                    VSpacing(TSpacing * 2),
                    WButton(
                      backgroundColor: TColors.primary,
                      textColor: TColors.primary[-3],
                      text: "Pengguna Aplikasi",
                      onTap: () {
                        UCAdminDashboard.goToNewUserVerification();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
