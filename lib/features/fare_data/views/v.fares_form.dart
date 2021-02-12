import 'package:atlok/core/models/MFare.dart';
import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/fare_data/usecases/u.fares_form.dart';
import 'package:atlok/features/power_rates_data/usecases/u.power_rates_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VFaresForm extends StatefulWidget {
  final MFare fare;

  const VFaresForm({Key key, this.fare}) : super(key: key);

  @override
  _VFaresFormState createState() => _VFaresFormState();
}

class _VFaresFormState extends State<VFaresForm> {
  GlobalKey<FormState> _formKey;
  MFare _fare;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _fare = widget.fare ?? new MFare();
  }

  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
              ),
              backgroundColor: TColors.primary,
              title: Text(
                "Buat Tarif Daya",
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data Tarif",
                          style: TTextStyle.medium(
                            color: TColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        VSpacing(TSpacing * 2),
                        WTextField(
                          icon: Icons.workspaces_outline,
                          labelText: "Kode Tarif",
                          required: true,
                          onChanged: (String v) {
                            this._fare.code = v;
                          },
                          initialValue: _fare.code,
                        ),
                        WTextField(
                          icon: Icons.title,
                          labelText: "Nama Tarif",
                          required: true,
                          onChanged: (String v) {
                            this._fare.name = v;
                          },
                          initialValue: _fare.name,
                        ),
                        VSpacing(TSpacing * 4),
                        Text(
                          "Aksi",
                          style: TTextStyle.medium(
                            color: TColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        VSpacing(TSpacing * 2),
                        WButton(
                          backgroundColor: TColors.red,
                          isFilled: false,
                          textColor: TColors.red,
                          text: "Hapus",
                          onTap: () {},
                        ),
                        VSpacing(TSpacing * 2),
                        WButton(
                          backgroundColor: TColors.primary,
                          textColor: TColors.primary[-3],
                          text: "Simpan",
                          onTap: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            if (_fare.iD != null) {
                              await UCFaresForm(
                                context,
                                fare: this._fare,
                              ).update();

                              ExtendedNavigator.root.pushAndRemoveUntil(
                                  Routes.vFindFares, (route) => false);
                            } else {
                              await UCFaresForm(
                                context,
                                fare: this._fare,
                              ).create();
                              ExtendedNavigator.root.pop();
                            }

                            _formKey.currentState.reset();
                          },
                        ),
                        VSpacing(TSpacing * 4),
                      ],
                    ),
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
