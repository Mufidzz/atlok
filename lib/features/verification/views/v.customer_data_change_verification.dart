import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/models/MCustomerChange.dart';
import 'package:atlok/core/models/MPagedResponse.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/verification/usecases/u.customer_data_change_verification.dart';
import 'package:atlok/features/verification/widgets/w.customer_data_change_list.dart';
import 'package:flutter/material.dart';

class VCustomerDataChangeVerification extends StatefulWidget {
  @override
  _VCustomerDataChangeVerificationState createState() =>
      _VCustomerDataChangeVerificationState();
}

class _VCustomerDataChangeVerificationState
    extends State<VCustomerDataChangeVerification> {
  int _nextStart = -1;
  List<MACustomerChange> _changes = new List();

  bool initial = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UCCustomerDataChangeVerification(context)
        .loadCustomerChange(start: 0, count: 10)
        .then((value) {
      this._nextStart = value.nextStart;
      this._changes = value.list;
      setState(() {
        initial = false;
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
                "Verifikasi Perubahan",
                style: TTextStyle.medium(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            initial
                ? Container(
                    margin: EdgeInsets.only(
                        top: TSpacing * 8, bottom: TSpacing * 8),
                    width: 30,
                    height: 30,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    TSpacing * 6,
                    TSpacing * 4,
                    TSpacing * 6,
                    0,
                  ),
                  child: WCustomerDataChangeList(
                    nextStart: -1,
                    customers: _changes,
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
