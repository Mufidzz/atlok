import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/substation_data/usecases/u.substation_data_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class VSubstationDataForm extends StatefulWidget {
  final MSubstation substation;

  const VSubstationDataForm({Key key, this.substation}) : super(key: key);
  @override
  _VSubstationDataFormState createState() => _VSubstationDataFormState();
}

class _VSubstationDataFormState extends State<VSubstationDataForm> {
  GlobalKey<FormState> _formKey;
  MSubstation _substation;

  TextEditingController _latitudeController = new TextEditingController();
  TextEditingController _longitudeController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _substation = widget.substation ?? new MSubstation();
    _latitudeController.text = this._substation.latitude ?? "";
    _longitudeController.text = this._substation.longitude ?? "";
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
                "Buat Data Gardu",
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
                          "Data Gardu",
                          style: TTextStyle.medium(
                            color: TColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        VSpacing(TSpacing * 2),
                        WTextField(
                          icon: Icons.workspaces_outline,
                          labelText: "Nomor Gardu",
                          required: true,
                          onChanged: (String v) {
                            this._substation.code = v;
                          },
                          initialValue: _substation.code,
                        ),
                        WTextField(
                          icon: Icons.person_outline,
                          labelText: "Nama Gardu",
                          required: true,
                          onChanged: (String v) {
                            this._substation.name = v;
                          },
                          initialValue: _substation.name,
                        ),
                        VSpacing(TSpacing * 3),
                        Text(
                          "Data Lokasi",
                          style: TTextStyle.medium(
                            color: TColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        VSpacing(TSpacing * 2),
                        WTextField(
                          icon: Icons.adjust_rounded,
                          keyboardType: TextInputType.number,
                          labelText: "Latitude",
                          required: true,
                          onChanged: (String v) {
                            this._substation.latitude = v;
                          },
                          initialValue: _substation.latitude,
                          controller: _latitudeController,
                        ),
                        WTextField(
                          icon: Icons.adjust_rounded,
                          keyboardType: TextInputType.number,
                          labelText: "Longitude",
                          required: true,
                          onChanged: (String v) {
                            this._substation.longitude = v;
                          },
                          initialValue: _substation.longitude,
                          controller: _longitudeController,
                        ),
                        VSpacing(TSpacing * 2),
                        WButton(
                          backgroundColor: TColors.primary,
                          textColor: TColors.primary,
                          text: "Gunakan Lokasi Saat ini",
                          isFilled: false,
                          onTap: () {
                            final Geolocator geolocator = Geolocator()
                              ..forceAndroidLocationManager;

                            geolocator
                                .getCurrentPosition(
                                    desiredAccuracy: LocationAccuracy.best)
                                .then((Position position) {
                              setState(() {
                                _latitudeController.text =
                                    "${position.latitude}";
                                _longitudeController.text =
                                    "${position.longitude}";
                              });
                            });
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
                          backgroundColor: TColors.primary,
                          textColor: TColors.primary[-3],
                          text: "Simpan",
                          onTap: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            if (_substation.iD != null) {
                              await UCSubstationDataForm(
                                context,
                                substation: this._substation,
                              ).update();

                              ExtendedNavigator.root.pop();
                            } else {
                              await UCSubstationDataForm(
                                context,
                                substation: this._substation,
                              ).create();
                              ExtendedNavigator.root.pushAndRemoveUntil(
                                  Routes.vFindSubstationData, (route) => false);
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
