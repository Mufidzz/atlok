import 'package:atlok/core/models/MCustomer.dart';
import 'package:atlok/core/routes/router.gr.dart';
import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class VCustomerDataDetail extends StatelessWidget {
  final MACustomer customer;
  const VCustomerDataDetail({Key key, @required this.customer})
      : super(key: key);
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
                "Data Pelanggan",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Pelanggan",
                        style: TTextStyle.medium(
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      VSpacing(TSpacing * 3),
                      WDataInformationTile(
                        title: "ID Pelanggan",
                        content: "${customer.iDPEL}",
                      ),
                      WDataInformationTile(
                        title: "Nama Pelanggan",
                        content: "${customer.fullName}",
                      ),
                      WDataInformationTile(
                          title: "Alamat Lengkap",
                          content: "${customer.address}"),
                      WDataInformationTile(
                        title: "Tarif Daya",
                        content: "${customer.powerRating.name}",
                      ),
                      WDataInformationTile(
                        title: "Nomor Tiang",
                        content: "${customer.poleNumber}",
                      ),
                      WDataInformationTile(
                        title: "Nomor KWH",
                        content: "${customer.kWHNumber}",
                      ),
                      WDataInformationTile(
                        title: "Merk KWH",
                        content: "${customer.kWHBrand}",
                      ),
                      WDataInformationTile(
                        title: "TH TERA KWH",
                        content: "${customer.kWHYear}",
                      ),
                      WDataLocation(
                        latitude: "${customer.latitude}",
                        longitude: "${customer.longitude}",
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
                        backgroundColor: TColors.primary,
                        isFilled: false,
                        textColor: TColors.primary,
                        text: "Informasi Gardu",
                        onTap: () {
                          ExtendedNavigator.root.push(
                            Routes.vSubstationDataDetail,
                            arguments: VSubstationDataDetailArguments(
                                substation: customer.substation),
                          );
                        },
                      ),
                      VSpacing(TSpacing * 2),
                      WLeveledWidget(
                        minimumLevel: 1,
                        child: Column(
                          children: [
                            WButton(
                              backgroundColor: TColors.red,
                              isFilled: false,
                              textColor: TColors.red,
                              text: "Hapus Data",
                              onTap: () {},
                            ),
                            VSpacing(TSpacing * 2),
                            WButton(
                              backgroundColor: TColors.primary,
                              textColor: TColors.primary[-3],
                              text: "Edit Data",
                              onTap: () {},
                            ),
                            VSpacing(TSpacing * 2),
                          ],
                        ),
                      ),
                      WLeveledWidget(
                        reverseOperator: true,
                        minimumLevel: 0,
                        child: WButton(
                          backgroundColor: TColors.primary,
                          textColor: TColors.primary[-3],
                          text: "Ajukan Perubahan",
                          onTap: () {},
                        ),
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
