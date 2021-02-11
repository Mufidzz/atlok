import 'package:atlok/core/models/MUser.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/verification/usecases/u.user_register_verification.dart';
import 'package:flutter/material.dart';

class VUserRegisterVerification extends StatefulWidget {
  @override
  _VUserRegisterVerificationState createState() =>
      _VUserRegisterVerificationState();
}

class _VUserRegisterVerificationState extends State<VUserRegisterVerification> {
  List<MUser> _users = new List();
  int _nextStart = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UCUserRegisterVerification(context)
        .loadUnverifiedUsers(start: 0, count: 10)
        .then((value) {
      setState(() {
        _users = value.list;
        _nextStart = value.nextStart;
      });
    });
  }

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
                "Verifikasi Pengguna",
                style: TTextStyle.medium(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    TSpacing * 6,
                    TSpacing * 4,
                    TSpacing * 6,
                    0,
                  ),
                  child: WUserList(
                    users: _users,
                    nextStart: _nextStart,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
