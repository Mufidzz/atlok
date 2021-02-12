import 'package:atlok/core/config/config.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/auth/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VLogin extends StatefulWidget {
  @override
  _VLoginState createState() => _VLoginState();
}

class _VLoginState extends State<VLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sp) {
      if (sp.getString(SPKey.token) != null &&
          sp.getString(SPKey.token) != "") {
        ExtendedNavigator.root
            .pushAndRemoveUntil(Routes.vFindCustomerData, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: TSpacing * 8,
              right: TSpacing * 8,
            ),
            child: Column(
              children: [
                WHeader(
                  text: "Login",
                ),
                WLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
