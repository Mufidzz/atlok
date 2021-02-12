import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/models/MCustomerChange.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:atlok/features/customer_data/usecases/u.customer_data_form.dart';
import 'package:atlok/features/verification/usecases/u.customer_data_change_verification.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VCustomerDataChangeRequest extends StatefulWidget {
  final MCustomerChange customerChange;

  const VCustomerDataChangeRequest({Key key, @required this.customerChange})
      : super(key: key);

  @override
  _VCustomerDataChangeRequestState createState() =>
      _VCustomerDataChangeRequestState();
}

class _VCustomerDataChangeRequestState
    extends State<VCustomerDataChangeRequest> {
  MACustomer oldData;
  MACustomer newData;
  MACustomer _selectedData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UCCustomerDataChangeVerification(context)
        .loadCustomer(id: widget.customerChange.currentCustomerID.toString())
        .then((value) {
      setState(() {
        this.oldData = value;
      });
    }).then((value) {
      UCCustomerDataChangeVerification(context)
          .loadCustomer(id: widget.customerChange.newCustomerID.toString())
          .then((value) {
        setState(() {
          this.newData = value;
        });
      });
    }).then((value) {
      setState(() {
        _selectedData = oldData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WSafeArea(
      color: TColors.primary,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: TColors.primary,
              title: Text(
                "Data Ajuan Perubahan",
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
                  child: _selectedData == null
                      ? CircularProgressIndicator()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: WButton(
                                    onTap: () {
                                      setState(() {
                                        _selectedData = oldData;
                                      });
                                    },
                                    text: "Data Lama",
                                    isFilled: _selectedData == oldData,
                                    textColor: _selectedData == oldData
                                        ? TColors.primary[-3]
                                        : TColors.primary,
                                    backgroundColor: TColors.primary,
                                  ),
                                ),
                                HSpacing(TSpacing * 3),
                                Expanded(
                                  child: WButton(
                                    onTap: () {
                                      setState(() {
                                        _selectedData = newData;
                                      });
                                    },
                                    text: "Data Baru",
                                    backgroundColor: TColors.primary,
                                    isFilled: _selectedData == newData,
                                    textColor: _selectedData == newData
                                        ? TColors.primary[-3]
                                        : TColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            VSpacing(TSpacing * 6),
                            Text(
                              "Informasi Pelanggan ${_selectedData == oldData ? "Lama" : "Baru"}",
                              style: TTextStyle.medium(
                                color: TColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            VSpacing(TSpacing * 3),
                            WDataInformationTile(
                              title: "ID Pelanggan",
                              content: "${_selectedData.iDPEL}",
                            ),
                            WDataInformationTile(
                              title: "Nama Pelanggan",
                              content: "${_selectedData.fullName}",
                            ),
                            WDataInformationTile(
                              title: "Alamat Lengkap",
                              content: "${_selectedData.address}",
                            ),
                            WDataInformationTile(
                              title: "Tarif Daya",
                              content:
                                  "${_selectedData.powerRating.code} / ${_selectedData.powerRating.name}",
                            ),
                            WDataInformationTile(
                              title: "Nomor Tiang",
                              content: "${_selectedData.poleNumber}",
                            ),
                            WDataInformationTile(
                              title: "Nomor KWH",
                              content: "${_selectedData.kWHNumber}",
                            ),
                            WDataInformationTile(
                              title: "Merk KWH",
                              content: "${_selectedData.kWHBrand}",
                            ),
                            WDataInformationTile(
                              title: "TH TERA KWH",
                              content: "${_selectedData.kWHYear}",
                            ),
                            WDataLocation(
                              latitude: _selectedData.latitude,
                              longitude: _selectedData.longitude,
                            ),
                            VSpacing(TSpacing * 2),
                            WButton(
                              backgroundColor: TColors.primary,
                              isFilled: false,
                              textColor: TColors.primary,
                              text: "Informasi Gardu",
                              onTap: () {
                                ExtendedNavigator.root.push(
                                    Routes.vSubstationDataDetail,
                                    arguments: VSubstationDataDetailArguments(
                                        substation: _selectedData.substation));
                              },
                            ),
                            VSpacing(TSpacing * 3),
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
                              text: "Tolak",
                              onTap: () async {
                                await UCCustomerDataChangeVerification(context)
                                    .denyChange(
                                        customerChangeID: widget
                                            .customerChange.iD
                                            .toString());

                                ExtendedNavigator.root.pushAndRemoveUntil(
                                    Routes.vCustomerDataChangeVerification,
                                    (route) => false);
                              },
                            ),
                            VSpacing(TSpacing * 2),
                            WButton(
                              backgroundColor: TColors.primary,
                              textColor: TColors.primary[-3],
                              text: "Terima",
                              onTap: () async {
                                await UCCustomerDataChangeVerification(context)
                                    .acceptChange(
                                        customerChangeID: widget
                                            .customerChange.iD
                                            .toString());
                                ExtendedNavigator.root.pushAndRemoveUntil(
                                    Routes.vCustomerDataChangeVerification,
                                    (route) => false);
                              },
                            ),
                            VSpacing(TSpacing * 4),
                          ],
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
