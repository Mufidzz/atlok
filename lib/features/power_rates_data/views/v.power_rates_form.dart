import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/power_rates_data/usecases/u.power_rates_form.dart';
import 'package:flutter/material.dart';

class VPowerRatesForm extends StatefulWidget {
  @override
  _VPowerRatesFormState createState() => _VPowerRatesFormState();
}

class _VPowerRatesFormState extends State<VPowerRatesForm> {
  GlobalKey<FormState> _formKey;
  MPowerRate _powerRate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _powerRate = new MPowerRate();
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
                onPressed: () {},
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
                          "Data Tarif Daya",
                          style: TTextStyle.medium(
                            color: TColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        VSpacing(TSpacing * 2),
                        WTextField(
                          icon: Icons.workspaces_outline,
                          labelText: "Kode Tarif Daya",
                          required: true,
                          onChanged: (String v) {
                            this._powerRate.code = v;
                          },
                        ),
                        WTextField(
                          icon: Icons.title,
                          labelText: "Nama Tarif Daya",
                          required: true,
                          onChanged: (String v) {
                            this._powerRate.name = v;
                          },
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
                            await UCPowerRatesForm(
                              context,
                              powerRate: this._powerRate,
                            ).create();

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
