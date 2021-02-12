import 'package:atlok/core/routes/routes.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WLeveledWidget.dart';

class WMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: TSpacing * 16,
                bottom: TSpacing * 12,
              ),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    RAssets.Logo,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      color: TColors.primary[-2],
                    ),
                    ListTile(
                      onTap: () {
                        ExtendedNavigator.root.pushAndRemoveUntil(
                            Routes.vFindCustomerData,
                            (Route<dynamic> route) => false);
                      },
                      title: Text(
                        "Cari Data",
                        style: TTextStyle.normal(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Icon(Icons.search),
                    ),
                    WLeveledWidget(
                      minimumLevel: 1,
                      child: Column(
                        children: [
                          Divider(
                            color: TColors.primary[-2],
                          ),
                          ListTile(
                            onTap: () {
                              ExtendedNavigator.root.pushAndRemoveUntil(
                                  Routes.vAdminDashboard,
                                  (Route<dynamic> route) => false);
                            },
                            title: Text(
                              "Menu Admin",
                              style: TTextStyle.normal(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: Icon(Icons.admin_panel_settings_outlined),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: TColors.primary[-2],
                    ),
                    ListTile(
                      onTap: () {
                        SharedPreferences.getInstance()
                            .then((sp) => sp.clear());
                        ExtendedNavigator.root.pushAndRemoveUntil(
                            Routes.vLogin, (Route<dynamic> route) => false);
                      },
                      title: Text(
                        "Logout",
                        style: TTextStyle.normal(
                          fontWeight: FontWeight.w600,
                          color: TColors.red,
                        ),
                      ),
                      leading: Icon(
                        Icons.clear_outlined,
                        color: TColors.red[-1],
                      ),
                    ),
                    Divider(
                      color: TColors.primary[-2],
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
