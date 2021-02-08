import 'package:atlok/core/themes/themes.dart';
import 'package:atlok/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VCustomerDataChangeRequest extends StatelessWidget {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: WButton(
                              onTap: () {},
                              text: "Data Lama",
                              textColor: TColors.primary[-3],
                              backgroundColor: TColors.primary,
                            ),
                          ),
                          HSpacing(TSpacing * 3),
                          Expanded(
                            child: WButton(
                              onTap: () {},
                              text: "Data Baru",
                              textColor: TColors.primary,
                              backgroundColor: TColors.primary,
                              isFilled: false,
                            ),
                          ),
                        ],
                      ),
                      VSpacing(TSpacing * 6),
                      Text(
                        "Informasi Pelanggan Lama",
                        style: TTextStyle.medium(
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      VSpacing(TSpacing * 3),
                      WDataInformationTile(
                        title: "ID Pelanggan",
                        content: "12345678901234267890",
                      ),
                      WDataInformationTile(
                        title: "Nama Pelanggan",
                        content: "12345678901234267890",
                      ),
                      WDataInformationTile(
                        title: "Alamat Lengkap",
                        content:
                            "Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, Alamat Lengkap, ",
                      ),
                      WDataInformationTile(
                        title: "Tarif Daya",
                        content: "900V R1",
                      ),
                      WDataInformationTile(
                        title: "Nomor Tiang",
                        content: "ABCDE1234567890",
                      ),
                      WDataInformationTile(
                        title: "Merk KWH",
                        content: "ABCDE1234567890",
                      ),
                      WDataInformationTile(
                        title: "TH TERA KWH",
                        content: "123456789.00",
                      ),
                      WDataLocation(),
                      VSpacing(TSpacing * 2),
                      WButton(
                        backgroundColor: TColors.primary,
                        isFilled: false,
                        textColor: TColors.primary,
                        text: "Informasi Gardu",
                        onTap: () {},
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
                        onTap: () {},
                      ),
                      VSpacing(TSpacing * 2),
                      WButton(
                        backgroundColor: TColors.primary,
                        textColor: TColors.primary[-3],
                        text: "Terima",
                        onTap: () {},
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
