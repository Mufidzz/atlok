import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VLogin extends StatelessWidget {
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
