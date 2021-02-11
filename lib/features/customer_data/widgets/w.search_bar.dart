import 'package:atlok/core/models/MPowerRate.dart';
import 'package:atlok/core/models/MSubstation.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/utilities/UShowDialog.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/customer_data/usecases/u.find_customer_data.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class WSearchBar extends StatefulWidget {
  final Function afterFind;
  final Function beforeFind;
  const WSearchBar({
    Key key,
    this.afterFind,
    this.beforeFind,
  }) : super(key: key);

  @override
  _WSearchBarState createState() => _WSearchBarState();
}

class _WSearchBarState extends State<WSearchBar> {
  bool _advanceSearchActive = false;
  String _searchParam = "";

  MPowerRate _sPowerRate = new MPowerRate();
  MSubstation _sSubstation = new MSubstation();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: WTextField(
                labelText: "IDPEL / Nama Lengkap",
                icon: Icons.search,
                onChanged: (String v) {
                  this._searchParam = v;
                },
              ),
            ),
            HSpacing(TSpacing * 2),
            InkWell(
              onTap: () {
                setState(() {
                  _advanceSearchActive = _advanceSearchActive ? false : true;
                });
              },
              child: Container(
                height: 40,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(TSpacing),
                      boxShadow: [
                        TBoxShadow.cardNormal(),
                      ],
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: TColors.primary,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        _advanceSearchActive
            ? Column(
                children: [
                  VSpacing(TSpacing),
                  WButton(
                    backgroundColor: TColors.primary,
                    onLongPress: () {
                      setState(() {
                        _sPowerRate = new MPowerRate();
                      });
                    },
                    onTap: () {
                      if (_sPowerRate.name != null) {
                        Flushbar(
                          message: "Tekan Lama Untuk Menghapus",
                          duration: Duration(seconds: 1),
                        )..show(context).then((value) {
                            UDialog(context)
                                .showPowerRateSelectDialog()
                                .then((v) {
                              if (v != null) {
                                setState(() {
                                  _sPowerRate = v;
                                });
                              }
                            });
                          });
                      } else {
                        UDialog(context).showPowerRateSelectDialog().then((v) {
                          if (v != null) {
                            setState(() {
                              _sPowerRate = v;
                            });
                          }
                        });
                      }
                    },
                    text: _sPowerRate.name ?? "Pilih Tarif Daya",
                    isFilled: false,
                    textColor: TColors.primary,
                  ),
                  VSpacing(TSpacing * 2),
                  WButton(
                    backgroundColor: TColors.primary,
                    onLongPress: () {
                      setState(() {
                        _sSubstation = new MSubstation();
                      });
                    },
                    onTap: () {
                      if (_sSubstation.name != null) {
                        Flushbar(
                          message: "Tekan Lama Untuk Menghapus",
                          duration: Duration(seconds: 1),
                        )..show(context).then((value) {
                            UDialog(context)
                                .showSubstationSelectDialog()
                                .then((v) {
                              if (v != null) {
                                setState(() {
                                  _sSubstation = v;
                                });
                              }
                            });
                          });
                      } else {
                        UDialog(context).showSubstationSelectDialog().then((v) {
                          if (v != null) {
                            setState(() {
                              _sSubstation = v;
                            });
                          }
                        });
                      }
                    },
                    text: _sSubstation.name ?? "Pilih Gardu",
                    isFilled: false,
                    textColor: TColors.primary,
                  ),
                  VSpacing(TSpacing),
                ],
              )
            : SizedBox(),
        VSpacing(TSpacing),
        WButton(
          text: "Cari",
          textColor: TColors.primary[-3],
          onTap: () async {
            widget.beforeFind();

            List<String> ext = new List();
            if (_sPowerRate.iD != null) {
              ext.add("pr=${_sPowerRate.iD}");
            }
            if (_sSubstation.iD != null) {
              ext.add("s=${_sSubstation.iD}");
            }

            var r = await UCFindCustomerData(context).searchCustomer(
              param: "$_searchParam",
              start: 0,
              count: 10,
              ext: ext,
            );

            widget.afterFind(r, _searchParam);
          },
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
